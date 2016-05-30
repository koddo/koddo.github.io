---
title:   "Algorithms todo list"
layout:  collection_page

---

how to iterate over a binary tree

b-tree

https://www.quora.com/As-we-start-planning-the-next-edition-of-Introduction-to-Algorithms-CLRS-what-should-we-add-and-what-should-we-remove

dfs with explicit stack --- http://stackoverflow.com/questions/5278580/non-recursive-depth-first-search-algorithm/5278667#5278667

https://en.wikipedia.org/wiki/N-gram

trie
https://en.wikipedia.org/wiki/Compact_prefix_tree
https://en.wikipedia.org/wiki/Radix_tree




invert binary tree, yes






# Trash


{% for member in site.data.members %}
- {{ member.name }}, https://github.com/{{ member.github }}
{% endfor %}

{% assign asdf = site.data.members | where: "github", "parkr" | first %}
{{ asdf.name }}, <https://github.com/{{ asdf.github }}>

| col 3 is      | \\(\Theta(l)\\) | $1600  |
| col 2 is      | centered        | $12    |
| zebra stripes | are neat        | $1     |
{: .mytable}


