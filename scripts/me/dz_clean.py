"""Clean Dzongkha text extracted from some RCSC PDFs, whose font adds a stray subjoined LA (U+0FB3) before the vowel
O (U+0F7C): དཔློན -> དཔོན. Words where the subjoined LA is real (སློབ, བློ, གློག, ཀློག, ཟློས) are kept.
The result must still be read by a fluent Dzongkha reader."""
import re

KEEP = ("སློབ", "བློ", "གློག", "ཀློག", "ཟློས", "བསློ")


def clean(text: str) -> str:
    def fix(m):
        syl = m.group(0)
        return syl if any(syl.startswith(k) for k in KEEP) else syl.replace("ློ", "ོ")
    return re.sub(r"[ཀ-ྼ]+", fix, text)


if __name__ == "__main__":
    import sys
    print(clean(sys.stdin.read()))
