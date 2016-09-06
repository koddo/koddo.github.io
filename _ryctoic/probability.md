---
title:   "Probability"
layout:  collection_page
mathjax: true

---

# combinatorics

\\[ \binom{N}{n} \ = \ \frac{N!}{(N-n)! \ n!} \\]


q: number of combinations
q: number of permutations

# axioms

- \\( P(\Omega) = 1 \\)
- \\( P(A) \ge 0 \\)
- \\( P(A+B) = P(A) + P(B) \\)

## sigma-additive measure example

$$
\begin{align*}
P(\{\text{outcome is even}\}) &= P( \{2\} + \{4\} + \{6\} + \ldots) = \\
&= P(\{2\}) + P(\{4\}) + P(\{6\}) + \ldots = \\
&= \frac{1}{2^2} + \frac{1}{2^4} + \frac{1}{2^6} + \ldots = \\ 
&= \frac{1}{4} \cdot (1 + \frac{1}{4} + \frac{1}{4^2} + \frac{1}{4^3} + \ldots) = \\ 
&= \frac{1}{4} \cdot \frac{1}{1-\frac{1}{4}} = \frac{1}{3}
\end{align*}
$$

TODO: more examples


<div class="ryctoic-questions" markdown="1">
- q: why do we need sigma-additiveness?
</div>


## Boole and Bonferroni inequalities

\\( P(A + B) \ \leq \ P(A) + P(B) \\)
\\( P(AB) \ \geq \ P(A) + P(B) - 1 \\)

<div class="ryctoic-questions" markdown="1">
- q: \\( P(A + B) \ \bigvee \ P(A) + P(B) \\)
- q: \\( P(AB) \ \bigvee \ P(A) + P(B) \\)
</div>

TODO: check if there are more under these names

# conditional probability

\\[ P(A \, \| \, B) \ = \ \frac{P(AB)}{P(B)} \\]

# independence

Threre are two equivalent definitions:

\\[ P(A \, \| \, B) \ = \ P(A), \  \text{ when } P(B) \neq 0 \\]

\\[ \text{or} \\]

\\[ P(AB) \ = \ P(A) \cdot P(B) \\]

The first one is more intuitive, the second one doesn't have to have a condition.

Don't confuse independence and disjointness!

{: .centered}
![probability independence](./images/probability.independence.001.svg)

\\[ P( \\{ {\color{#5599ff}\text{first is 2}} \\}, \\{ {\color{#de8787}\text{second is 3}} \\}) \ = \ \frac{1}{16} \ = \ P(\\{ {\color{#5599ff}\text{first is 2}} \\}) \cdot P(\\{ {\color{#de8787}\text{second is 3}} \\}) \\]

\\[ P( \\{ {\color{#5599ff}\text{first is 2}} \\}, \\{ {\color{#00daae}\text{first is 4}} \\}) \ = 0 \ \neq \ P(\\{ {\color{#5599ff}\text{first is 2}} \\}) \cdot P(\\{ {\color{#00daae}\text{first is 4}} \\}) \\]

\\[ P( \\{ {\color{#5599ff}\text{first is 2}} \\}, \\{ {\color{#dd55ff}\text{sum is 7}} \\}) \ = \ \frac{1}{16} \ = \ P(\\{ {\color{#5599ff}\text{first is 2}} \\}) \cdot P(\\{ {\color{#dd55ff}\text{sum is 7}} \\})\\]


## conditional independence

\\[ P(AB \, \| \, C) \ = \ P(A \, \| \, C) \cdot P(B \, \| \, C) \\]

Independence doesn't imply conditional independence.

Here \\( P(AB) = P(A) \cdot P(B) \\), but \\( P(AB \, \| \, C) = 0 \neq P(A \, \| \, C) \cdot P(B \, \| \, C) \\):

{: .centered}
![conditional independence](./images/probability.conditional_independence.001.svg)

\\[ P \left( \\{ {\color{#5599ff}\text{first is 2}} \\} \\{ {\color{#de8787}\text{second is 3}} \\} \ \middle\vert \ \\{ {\color{#dd55ff}\text{sum is 7}} \\} \right) \ = 0 \ \neq \ \frac{1}{16} \ = \ P(\\{ {\color{#5599ff}\text{first is 2}} \ \| \ \\{ {\color{#dd55ff}\text{sum is 7}} \\}) \cdot P(\\{ {\color{#de8787}\text{second is 3}} \ \| \ \\{ {\color{#dd55ff}\text{sum is 7}} \\}) \\]

Example of _independent_, but _not conditionally independent_. Flipping two coins. \\( A = \\{ \text{1st heads} \\} \\), \\( B = \\{ \text{2nd heads} \\} \\), \\( C = \\{ \text{both are same} \\} \\). \\( A, \ B \\) are independent, but not conditionally independent

Example of _not independent_, but _conditionally independent_. There are two coins: a fair and one with heads on both sides. \\( A = \\{ \text{1st heads} \\} \\), \\( B = \\{ \text{2nd heads} \\} \\), \\( C = \\{ \text{the coin is fair} \\} \\)

{: .centered}
![_not independent_, but _conditionally independent_](./images/probability.conditional_independence.two-heads-coin.001.svg)


<div class="ryctoic-questions" markdown="1">
- q: Definition of independence. --- a: \\( P(A \, \| \, B) \ = \ P(A) \text{, when } P(B) \neq 0 \\), or equivalent one, \\( P(AB) \ = \ P(A) \cdot P(B) \\)
- q: Independence vs disjointness.
- q: An example of _independent_, but _not conditionally independent_ events.
- q: An example of _not independent_, but _conditionally independent_ events.
</div>






