---
title:   "Algorithms"
layout:  collection_page

---


{% if false %}
# Contents
{:.no_toc}
{% endif %}

* this line is replaced with the generated table of contents
{:toc}


# Trie

derived from the word "re*trie*val" and pronounced as "try" to distinguish from "tree"

keys are words, alphabet of size \\(A\\)
number of words in the trie is \\(N\\)

functions:

- insert a key, value
- retrieve a value by key
- delete a key --- lazy without clean up, eager with clean up

\\(\Theta(l)\\), where \\(l\\) is a word length, search miss \\(O(\log_A{N})\\) --- <http://algs4.cs.princeton.edu/lectures/52Tries.pdf#21>

- get number of keys in trie --- lazy dts, eager with number for the whole trie, very eager with numbers for nodes


- get all words with a prefix
- wildcard match
- longest word, which is a prefix of a given one



when you have anything to do with prefixes, alphabetical ordering
also easy to implement, no hash functions, resizing, rehashing

can be slower and require more space than a hash table, depends on data

number of pointers is between RN and RNw, where w is an average word length

application:

- dictionary kv-storage
- spellchecker, t9, word games
- wildcard searching
- sorting
- ip routing (longest prefix matching)
- full text search
- data compression
- computational biology
- storing and queryng xml

<http://algs4.cs.princeton.edu/52trie/>
<https://leetcode.com/articles/implement-trie-prefix-tree/>
<http://phpir.com/tries-and-wildcards/>
Skiena
<https://en.wikipedia.org/wiki/Trie#As_a_replacement_for_other_data_structures>
https://www.toptal.com/java/the-trie-a-neglected-data-structure#performance-tests

http://algs4.cs.princeton.edu/lectures/52Tries.pdf
http://www.cs.princeton.edu/courses/archive/fall05/cos226/lectures/trie.pdf

exercises:
<https://leetcode.com/problems/implement-trie-prefix-tree/>
<https://www.topcoder.com/community/data-science/data-science-tutorials/using-tries/>
<http://www.spoj.com/problems/PHONELST/>
<https://www.codechef.com/problems/EST>
<https://threads-iiith.quora.com/Tutorial-on-Trie-and-example-problems>
<https://www.hackerrank.com/challenges/contacts>
<https://www.hackerrank.com/challenges/no-prefix-set>




<div class="ryctoic" markdown="1">
- trie vs hash table and other search trees
- functions on trie and their implementations
- implementation of nodes
- time-space complexity
- applications
- what about to have hash tables or other data structures instead of arrays in trie nodes?
</div>


<div class="todo" markdown="1">
- TODO: illustraton of trie nodes implementation: <http://127.0.0.1:4001/algorithms/Algorithms.4th.by_Sedgewick_Wayne.pdf#747>
- TODO: search miss \\(O(\log_{A}{N})\\): <http://127.0.0.1:4001/algorithms/Algorithms.4th.by_Sedgewick_Wayne.pdf#756>
- TODO: space requirements and estimates table: <http://127.0.0.1:4001/algorithms/Algorithms.4th.by_Sedgewick_Wayne.pdf#758>
- TODO: exercises table: <http://127.0.0.1:4001/algorithms/Algorithms.4th.by_Sedgewick_Wayne.pdf#767>
- TODO: add exersices
- TODO: add comparements with other algorithms
- TODO: succinct trie --- <http://stevehanov.ca/blog/index.php?id=120>, [Succinct Trees in Practice](http://epubs.siam.org/doi/abs/10.1137/1.9781611972900.9)
- TODO: what is double-array trie? <https://linux.thai.net/~thep/datrie/datrie.html>
- TODO: directed acyclic word graph (aka dawg)
- TODO: radix tree
- TODO: fix wikipedia article on tries --- wrong complexity or memory
</div>

# Ternary search tree

when nodes have most children pointers used, trie is more space and time efficient than the TST

good for large alphabets, ascii, unicode --- tries won't handle this

TODO: can build balanced TSTs via rotations to achieve \( L + \log N \) worst-case guarantees, but probably not worth the trouble, since they work good even without this --- <http://algs4.cs.princeton.edu/lectures/52Tries.pdf#34>
as fast as hash tables for string keys, space efficient

# Skip list

<https://en.wikipedia.org/wiki/Skip_list>

<https://www.quora.com/Why-arent-skip-lists-used-more-often-instead-of-balanced-trees/answer/Jaap-Weel?srid=Ywn4>

<http://stackoverflow.com/questions/256511/skip-list-vs-binary-tree>

<https://www.cs.auckland.ac.nz/~jmor159/PLDS210/niemann/s_cm2.htm>

<http://blog.memsql.com/the-story-behind-memsqls-skiplist-indexes/>

<http://igoro.com/archive/skip-lists-are-fascinating/>

<http://eternallyconfuzzled.com/tuts/datastructures/jsw_tut_skip.aspx>

<https://www.cs.umd.edu/class/spring2008/cmsc420/L12.SkipLists.pdf>





