"""Draw the Data Interpretation charts for PE batch 4 in the style of the BCSE PE papers (labelled values,
Bhutanese places). Figures are illustrative. Usage: python3 -I charts_batch4.py <out dir>"""
import sys
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

OUT = sys.argv[1]
BLUE, RED, GREEN, GOLD, GREY = "#4f81bd", "#c0504d", "#9bbb59", "#f79646", "#8064a2"


def save(fig, name):
    fig.tight_layout()
    fig.savefig(f"{OUT}/{name}.png", dpi=110)
    plt.close(fig)


def grouped():
    places = ["Paro", "Thimphu", "Punakha", "Bumthang", "Haa"]
    a, b = [42, 60, 35, 25, 10], [55, 72, 30, 32, 14]
    fig, ax = plt.subplots(figsize=(7.5, 4.2))
    x = range(len(places))
    r1 = ax.bar([i - 0.2 for i in x], a, 0.4, color=BLUE, label="2022")
    r2 = ax.bar([i + 0.2 for i in x], b, 0.4, color=RED, label="2023")
    ax.bar_label(r1); ax.bar_label(r2)
    ax.set_xticks(list(x), places); ax.set_ylim(0, 85); ax.grid(axis="y", alpha=.4); ax.set_axisbelow(True)
    ax.set_title("Visitors to Five Dzongkhags (in thousands)", fontweight="bold")
    ax.set_xlabel("Dzongkhag", fontweight="bold"); ax.legend(loc="center left", bbox_to_anchor=(1, .5), frameon=False)
    save(fig, "b4-visitors")


def line():
    m = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    v = [1200, 1100, 950, 800, 700, 900]
    fig, ax = plt.subplots(figsize=(7.5, 4.2))
    ax.plot(m, v, marker="o", color=BLUE, linewidth=2)
    for i, y in enumerate(v): ax.annotate(str(y), (i, y), textcoords="offset points", xytext=(0, 8), ha="center")
    ax.set_ylim(0, 1400); ax.grid(alpha=.4)
    ax.set_title("Electricity Used by a School (units per month)", fontweight="bold"); ax.set_xlabel("Month", fontweight="bold")
    save(fig, "b4-electricity")


def pie():
    labels = ["Food", "Transport", "Books", "Phone", "Savings"]
    v = [40, 15, 20, 10, 15]
    fig, ax = plt.subplots(figsize=(6.5, 4.4))
    ax.pie(v, labels=[f"{l} {p}%" for l, p in zip(labels, v)], colors=[BLUE, RED, GREEN, GREY, GOLD], startangle=90, counterclock=False,
           wedgeprops={"edgecolor": "white"})
    ax.set_title("How Karma Spends His Monthly Allowance of Nu. 6,000", fontweight="bold")
    save(fig, "b4-allowance")


def single_bar():
    towns = ["Thimphu", "P/ling", "Gelephu", "Paro", "S/Jongkhar", "Bumthang"]
    v = [48, 36, 30, 24, 18, 12]
    fig, ax = plt.subplots(figsize=(7.5, 4.2))
    r = ax.bar(towns, v, color=GREEN, width=.6); ax.bar_label(r)
    ax.set_ylim(0, 60); ax.grid(axis="y", alpha=.4); ax.set_axisbelow(True)
    ax.set_title("New Businesses Registered in Six Towns in a Year", fontweight="bold"); ax.set_xlabel("Town", fontweight="bold")
    save(fig, "b4-businesses")


def distance_time():
    t = [0, 1, 2, 2.5, 4]
    d = [0, 50, 100, 100, 160]
    fig, ax = plt.subplots(figsize=(7.5, 4.2))
    ax.plot(t, d, marker="o", color=RED, linewidth=2)
    for x, y in zip(t, d): ax.annotate(f"({x:g} h, {y} km)", (x, y), textcoords="offset points", xytext=(4, -14 if y else 6), fontsize=8)
    ax.set_xlim(0, 4.5); ax.set_ylim(0, 180); ax.grid(alpha=.4)
    ax.set_title("A Bus Journey from Thimphu", fontweight="bold")
    ax.set_xlabel("Time (hours)", fontweight="bold"); ax.set_ylabel("Distance (km)", fontweight="bold")
    save(fig, "b4-bus")


for f in (grouped, line, pie, single_bar, distance_time):
    f()
print("charts written to", OUT)
