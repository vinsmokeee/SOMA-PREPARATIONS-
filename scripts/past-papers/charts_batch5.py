"""Charts for PE batch 5 in the BCSE PE style (labelled values, Bhutanese places). Illustrative figures.
Usage: python3 -I charts_batch5.py <out dir>"""
import sys
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

OUT = sys.argv[1]
BLUE, RED, GREEN, GOLD, GREY = "#4f81bd", "#c0504d", "#9bbb59", "#f79646", "#8064a2"


def save(fig, name):
    fig.tight_layout(); fig.savefig(f"{OUT}/{name}.png", dpi=110); plt.close(fig)


def apples():
    d = ["Paro", "Thimphu", "Haa", "Bumthang"]; a, b = [40, 25, 15, 30], [46, 20, 21, 36]
    fig, ax = plt.subplots(figsize=(7.5, 4.2)); x = range(len(d))
    r1 = ax.bar([i - .2 for i in x], a, .4, color=BLUE, label="2022"); r2 = ax.bar([i + .2 for i in x], b, .4, color=RED, label="2023")
    ax.bar_label(r1); ax.bar_label(r2); ax.set_xticks(list(x), d); ax.set_ylim(0, 55); ax.grid(axis="y", alpha=.4); ax.set_axisbelow(True)
    ax.set_title("Apples Sold by Four Dzongkhags (tonnes)", fontweight="bold"); ax.set_xlabel("Dzongkhag", fontweight="bold")
    ax.legend(loc="center left", bbox_to_anchor=(1, .5), frameon=False); save(fig, "b5-apples")


def temps():
    m = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]; t, p = [4, 6, 10, 13, 16, 18], [16, 18, 22, 25, 27, 28]
    fig, ax = plt.subplots(figsize=(7.5, 4.2))
    ax.plot(m, t, marker="o", color=BLUE, linewidth=2, label="Thimphu"); ax.plot(m, p, marker="s", color=RED, linewidth=2, label="Phuentsholing")
    for i, (y1, y2) in enumerate(zip(t, p)):
        ax.annotate(str(y1), (i, y1), textcoords="offset points", xytext=(0, -14), ha="center")
        ax.annotate(str(y2), (i, y2), textcoords="offset points", xytext=(0, 7), ha="center")
    ax.set_ylim(0, 32); ax.grid(alpha=.4); ax.legend(frameon=False)
    ax.set_title("Average Monthly Temperature (°C)", fontweight="bold"); ax.set_xlabel("Month", fontweight="bold"); save(fig, "b5-temperature")


def land():
    lab, v = ["Farmland", "Forest", "Houses", "Pasture"], [35, 40, 10, 15]
    fig, ax = plt.subplots(figsize=(6.5, 4.4))
    ax.pie(v, labels=[f"{l} {p}%" for l, p in zip(lab, v)], colors=[GOLD, GREEN, RED, BLUE], startangle=90, counterclock=False, wedgeprops={"edgecolor": "white"})
    ax.set_title("Land Use in a Village of 400 Acres", fontweight="bold"); save(fig, "b5-landuse")


def colleges():
    c, v = ["College A", "College B", "College C", "College D", "College E"], [18, 12, 9, 15, 6]
    fig, ax = plt.subplots(figsize=(7.5, 4.2)); r = ax.bar(c, v, color=GREY, width=.6); ax.bar_label(r)
    ax.set_ylim(0, 22); ax.grid(axis="y", alpha=.4); ax.set_axisbelow(True)
    ax.set_title("Students in Five Colleges (in hundreds)", fontweight="bold"); ax.set_xlabel("College", fontweight="bold"); save(fig, "b5-colleges")


def study():
    h, m = [1, 2, 3, 4, 5, 6], [40, 48, 55, 63, 70, 78]
    fig, ax = plt.subplots(figsize=(7.5, 4.2)); ax.plot(h, m, marker="o", color=GREEN, linewidth=2)
    for x, y in zip(h, m): ax.annotate(str(y), (x, y), textcoords="offset points", xytext=(0, 8), ha="center")
    ax.set_xlim(0, 7); ax.set_ylim(0, 90); ax.grid(alpha=.4)
    ax.set_title("Hours Studied per Day and Test Marks", fontweight="bold")
    ax.set_xlabel("Hours studied per day", fontweight="bold"); ax.set_ylabel("Marks (out of 100)", fontweight="bold"); save(fig, "b5-study")


for f in (apples, temps, land, colleges, study):
    f()
print("charts written to", OUT)
