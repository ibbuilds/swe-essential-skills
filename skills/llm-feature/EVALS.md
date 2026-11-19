# Evals that tell the truth

## Find what is failing before writing checks

1. **Read real outputs.** Pull 30–100 recent traces or outputs, from logs or by running the current prompt over realistic inputs. Done when you have read each one.
2. **Note the first failure in each.** One short note per bad output, in plain words ("cites a product we don't sell"). The first failure only: later ones are often caused by it.
3. **Group the notes** into 3–8 failure categories and count each. Categories come from the notes, not from a generic list (helpfulness, tone). Done when every note is in one category and the counts are sorted.
4. **Fix the top category before measuring it.** Many are bugs in code, retrieval or the tool schema rather than the prompt. Write a check only for failures that would recur after the fix.

## Checks

- One check per failure category, pass/fail. No 1–5 scales and no "overall quality" judge.
- Code first: schema validity, exact fields, regexes, length, a forbidden-string list.
- An LLM judge only for what code cannot decide. The judge prompt gives the one criterion, a pass example and a fail example, and asks for reasoning before the verdict.

## Trusting a judge

Hand-label 50–100 outputs pass or fail yourself. Split them: a few as examples in the judge prompt, the rest held out. On the held-out set, report how often the judge agrees on real passes (true positive rate) and real fails (true negative rate) separately; raw accuracy hides a judge that passes everything. Tune the judge prompt until both are above 0.9, then never put held-out cases in the prompt.

## When changing the prompt

Score the current prompt first. Write 2–4 candidate changes, run each on the same cases, keep the best only if it beats the current score on cases it was not tuned on, and stop when two rounds bring no gain.
