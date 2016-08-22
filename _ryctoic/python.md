---
title:   "Python"
layout:  collection_page

---

* this line is replaced with the generated table of contents
{:toc}


# true, false, and comparison in python

``` python
if () or [] or {} or None:
    'this line is skipped'
```
<https://docs.python.org/3/library/stdtypes.html#truth-value-testing>


<br/>

The interesting thing in python: `b == not a` is a syntax error.
`not` has a lower priority than non-boolean operators, so `not a == b` is interpreted as `not (a == b)`, and `b == not a` is a syntax error.
<https://docs.python.org/3/library/stdtypes.html#boolean-operations-and-or-not>

<br/>

as always, `and` and `or` are short-circuit operators, second argument is not evaluated here:

``` python
if False and whatever():
    'this line is skipped, whatever() is not evaluated'
```

<br/>

`x < y <= z` is equivalent to `x < y and y <= z`, except `y` is evaluated only once
in both cases `z` is not evaluated at all when `x < y` is found to be false

<br/>

comparison operators look quite standard: `==`, `!=`, `<`, `>`, `<=`, `>=`
and for object identity: `is`, `is not`
objects of different _built-in_ types never compare equal (except different numeric types), but we can define an object with `__eq__` --- <http://stackoverflow.com/questions/12379840/python-comparison-between-built-in-and-user-defined-types>
`<`, `>`, `<=`, `>=` raise `TypeError` exception when the objects are of different types that cannot be compared, or in other cases where there is no defined ordering

``` python
>>> 'abc' > 1000
TypeError: unorderable types: str() > int()
```

behavior of the `is` and `is not` operators cannot be customized; also they can be applied to any two objects and never raise an exception

<https://docs.python.org/3/library/stdtypes.html#comparisons>

<br/>


<div class="ryctoic-questions" markdown="1">
- q: what values are considered false in python? --- a: `False`, `None`, any numeric zero, empty sequence, empty map, instance with `__bool__()` returning False or `__len__()` returning zero
- q: `not a == b` vs `not (a == b)` vs `b == not a` --- a: not has a lower priority than non-Boolean operators, so `not a == b` is interpreted as `not (a == b)`, and `b == not a` is a syntax error
- q: `if False and whatever(): 'this line is skipped'`
- q: `x < y <= z` vs `x < y and y <= z` --- a: `x < y <= z` is equivalent to `x < y and y <= z`, except `y` is evaluated only once, and in both cases `z` is not evaluated at all when `x < y` is found to be false
- q: what are comparison operators? --- a: `==`, `!=`, `<`, `>`, `<=`, `>=`, `is`, `is not`
- q: when are two objects of different types compare equal? --- a: objects of different _built-in_ types never compare equal (except different numeric types), but we can define an object with `__eq__`
- q: what happens when you compare different types? `'a' == 1` and `'abc' > 10` a: the former is false, the latter raises `TypeError` exception
- q: how to customize behavior of `is` and `is not`? --- a: behavior of the `is` and `is not` operators cannot be customized; also they can be applied to any two objects and never raise an exception
</div>

<br />
<br />

# functions

function annotations: <https://github.com/kennknowles/python-rightarrow>

q: define a function with an optional argument --- a:?
q: define a function with a docstring --- a:?
q: define a function with a keyword-only arguments --- a: `def foo(*, arg1=10, arg2=20): ...`
q: define a function with an arbitraty argument list --- a: `def concat(*args, sep="/"): return sep.join(args)`
q: define a function with keyword arguments --- a: `def foo(**kwargs): print(kwargs)`, then call it like this: `foo(a=1, b=2)`, this will print `{'a': 1, 'b': 2}`
q: pass a list of arguments to a function with an arbitrary argument list --- a: given a function `def foo(*args): ...`, unpack the list `foo(*lst)`
q: pass a dictionary of arguments to a function with keyword arguments --- a: given a function `def foo(**kwargs): ...`, unpack the dict `foo(**dct)`
q: define a function with function annotations --- a: `def a_func(a_dict: '{str: int}') -> '[str]': print(a_func.__annotations__); ...`

TODO: new type hinting

# exceptions

TODO

q: catch multiple exceptions in one except block --- a: `except (IDontLIkeYouException, YouAreBeingMeanException) as e: ...`



# input

`input()` used to be `raw_input()` in python 2

<http://www.diveintopython3.net/porting-code-to-python-3-with-2to3.html#raw_input>

``` python
int( input().strip() )
```

q: `input()` vs `raw_input()`
q: get a string from input
q: get an integer from input
q: get a float from input
q: get a fraction from input


# conditionals

``` python
if False:
    whatever()
else:
    print('ok')
```

`switch/case` [pep-3103](https://www.python.org/dev/peps/pep-3103/)

``` python
{
    'a': 1,
    'b': 2,
}.get(x, 9)
```

q: write an if-then-else --- a:?
q: write a switch/case --- a: python doesn't have this, but we can have an if/elif chain or dict-based dispatch, but those do not support fall through, and this can be good or bad, depends on the point of view and problems you solve 

# loops

`range()` used to be `xrange()` in python 2



``` python
for n in range(0,100000000):
  pass

int i = 0
while i < 100000000:
  i += 1
```

<http://stackoverflow.com/questions/869229/why-is-looping-over-range-in-python-faster-than-using-a-while-loop>

TODO: range
q: `range` vs `xrange`
q: write a for loop from 0 to n --- a: `for i in range(n): ...`
q: get a range with a step --- a: `range(start, end, step)`
q: get a range going backwards --- a: `range(99, 0)`
q: get a range from `0` to `-10` with a step `2` --- a: `range(0, -10, -2)`
q: get a range from `99` to `0` with a step `2` --- a: `range(99, 0, -2)`
q: check if any element in list satisfies some condition --- a: `any(l == 'x' for l in a_string)`
q: `for i in range(10**10): ...` vs `i=0; while i < 10**10: i+=1; ...;`? --- a: the former is faster, code for `range()` is optimized, `i+=1` is interpreted

# lists

``` python
lst = []
lst += 'a'
lst += ['b']
lst.append(['c'])
lst.insert(0, '0')
lst == ['0', 'a', 'b', ['c']]

lst == [3, 1, 2]
sorted(lst)
```

`lst.sort()` returns `None`, here is why: <https://mail.python.org/pipermail/python-dev/2003-October/038855.html>

pre-allocating a list benchmark: <http://stackoverflow.com/questions/22225666/pre-allocating-a-list-of-none>

q: `sorted(l)` vs `l.sort()` --- a: `l.sort()` is destructive and, therefore, a bit faster
q: sort in descending order --- a: `sorted(l, reverse=True)` or `l.sort(reverse=True)`
q: get a list in reversed order --- a: `reversed(lst)` or `lst.reverse()` or `lst[::-1]`
q: sort by multiple criteria --- a: sorting is stable, so sort twice, or sort by tuples `sorted(lst, key = lambda x: (-x[1], x[0]))`, or `sorted(lst, key = operator.itemgetter(1, 2))`

TODO: destructive and non-destructive insert, remove, append, extend, sort, pop

q: pre-allocate a list of size `n` with a default value --- a: `lst = [None] * n` or `lst = [0] * n` with default value `0`, but try appending or list comprehension instead
q: pre-allocation of a list vs appending elements vs list comprehension --- a: pre-allocation is useful when elements you fill the list with come out of order, appending has complexity of `O(1)`, so no difference with list comprehension (unless you try to optimize, measure it yourself then) 

q: add an element to the end of a list --- a: `lst.append(e)`
q: concatenate two lists --- a: `lst1 + [1, 2]`
q: `lst1+lst2` vs `lst1.extend(lst2)` vs `lst1 += lst2` --- a: `.extend()` and `+=` are destructive, there is virtually no difference in performance; `.extend()` accepts any iterable, can do chaining like `getlst1().extend(lst2)`
q: add an element to a list, not at the end, but at a given position --- a: `lst.insert(pos, value)`, same as `lst[pos:pos] = [value]`
q: what does mean `lst[i:i] = [v]`? --- a: same as `lst.insert(i, v)`
q: `lst.append()` vs `lst.extend()` --- a: `.append(e)` appends an element, `.extend(l)` extends the list with elements from an iterable
q: what does `lst.sort()` return? --- a: `None`, this is to prevent chaining like `lst.sort().reverse()`
q: remove all elements from a list --- a: `lst.clear()`
q: `a, b, c` vs `(a, b, c) ` --- a: exactly the same, it is actually the comma which makes a tuple, not the parentheses, which are useful to avoid ambiguity, e.g., `f(a, b)` is different from `f( (a, b) )`
q: unpack `[1, [2, 3]]` into three variables --- a: `a, (b, c) = [1, [2, 3]]`

## slicing

``` python
a = [0, 1, 2, 3, 4, 5, 6, 7]
b = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
a[::2] = b[::2]
a == ['a', 1, 'c', 3, 'e', 5, 'g', 7]
```

q: get a sublist of a list including elements from second to fifth --- a: `a_list[1:6]`
q: get a sublist of a list including elements from second to the one before last --- a: `a_list[1:-1]`
q: get a sublist of a list including elements from third to last --- a: `a_list[2:]`
q: get a sublist of a list including elements from first to third --- a: `a_list[:3]`
q: replace every nth element of a list with elements from another list --- a:`lst[::n] = another_list`, assuming `len(another_list) == len(lst[::n])`
q: replace every nth element of a list with a value `t` --- a:`lst[::n] = t`

q: get a shallow copy of a list using slicing --- a: `a_list[:]`
q: what is a shallow copy? --- TODO
q: what does mean `a_list[:]`? --- a: same as `a_list.copy()`, which is shallow copy




## itertools module

``` python
lst = [('USA', 'LA'), ('Russia', 'Moscow'), ('USA', 'NY'), ('Russia', 'St. Petersburg'), ('England', 'London')]

[(k, list(g)) 
   for k, g in 
   itertools.groupby( sorted(lst), key = lambda x: x[0] )]
             ## [('England', [('England', 'London')]), ('Russia', [('Russia', 'Moscow'), ('Russia', 'St. Petersburg')]), ('USA', [('USA', 'LA'), ('USA', 'NY')])]

[(k, [j for i,j in g]) 
   for k, g in 
   itertools.groupby( sorted(lst), key = lambda x: x[0] )]
             ## [('England', ['London']), ('Russia', ['Moscow', 'St. Petersburg']), ('USA', ['LA', 'NY'])]



```

product
permutations
combinations

count(start=0[, step=1])
cycle(lst)
repeat(elem[, times=10])

groupby
accumulate
chain
dropwhile, takewhile
zip_longest

TODO: compress, better groupby, tee

q: get a cartesian product of two sequences --- a: `itertools.product(s1, s2)`
q: get permutations of length `k` of elements in a list --- a: `itertools.permutations(a_list, k)`
q: get combinations of length `k` of elements in a list --- a: `itertools.combinations(a_list, k)`
q: get combinations with repetitions of length `k` of elements in a list --- a: `itertools.combinations_with_replacement(a_list, k)`
q: divide a string into groups of repeated consecutive elements, e.g., `'AAAABBBCCDAA'` into `['AAAA', 'BBB', 'CC', 'D', 'AA']` --- a: `[''.join(list(g)) for k, g in itertools.groupby('AAAABBBCCDAA')]`
q: group elements of a list by some key, e.g., `[..., ('Russia', 'Moscow'), ..., ('Russia', 'St. Petersburg'), ...]` into  `[..., ('Russia', ['Moscow', 'St. Petersburg']), ...]`--- a: `[(k, [j for i,j in g]) for k, g in itertools.groupby(sorted(lst), lambda x: x[0])]`

q: get an iterator for an infinite sequence of numbers like `10, 15, 20, 25, ...` --- a: `from itertools import count; for i in count(start10, step=5): ...`
q: get an iterator, which infinitely goes through a list like `a, b, c -> a, b, c, a, b, c, a, ...` --- a: `from itertools import cycle; for i in cycle('abc'): ...`
q: get an iterator, which infinitely (or optionally for a given number of times) returns an element --- a: `from itertools import cycle; for i in repeat('a'): ...` or `repeat('a', times=10)`

q: get an iterator, which is similar to reduce, but returns an intermediate results --- a: `itertools.accumulate(lst, operator.mul)`
q: how to iterate over multiple lists, one after another, without concatenating --- a: `itertools.chain( [1, 2, 3], [4, 5, 6] )`
q: `itertools.chain()` vs `itertools.chain.from_iterable()` --- a: the latter gets lazily iterates over input, which can be infinite sequence
q: get rid of head of a list before a predicate becomes false --- a: `list(itertools.dropwhile(lambda x: x<3, [1, 2, 3, 1, 2, 3])) == [3, 1, 2, 3]`
q: get rid of tail of a list after a predicate becomes false --- a: `list(itertools.takewhile(lambda x: x<3, [1, 2, 3, 1, 2, 3])) == [1, 2]`
q: `slice()` vs `itertools.islice()` --- a: the latter is for iterators, which don't support indexing, consumes data on them; in most cases just use the former
q: `map()` vs `itertools.starmap()` --- a: the latter is for data, which has been pre-zipped, `list( itertools.starmap(pow, [(5,2), (3,2), (10,3)]) ) == [25, 9, 1000]`
q: `zip()` two sequences until the longest one is exhauseted, with a given value for missing bits --- a: `itertools.zip_longest(lst1, lst2, fillvalue=None)`
q: `zip()` vs `itertools.zip_longest()` --- a: the former stops when the shortest iterator is exhausted, the latter stops when the longest one is done

## collections module

q: get a dict, which which counts distinct elements in a list --- a: `collections.Counter(list)`
q: get a dict with default value `'foo'` --- a: `collections.defaultdict(lambda: 'foo')`
q: get a dict with default value `0` --- a: `collections.defaultdict(int)`
q: get a dict with default value `[]` --- a: `collections.defaultdict(list)`
q: `dict` vs `collections.defaultdict` --- a: `d['non-existent key']` raises `KeyError`, `defaultdict` adds and returns a default value
q: what happens when you try to acces a non-existent key in a dict? --- a: it raises `KeyError`
q: create a named tuple --- a: `Point = collections.namedtuple('Point', 'x, y')`
q: get a dictionary, which preserves the order in which its elements are added --- a: `od = collections.OrderedDict(); od['a'] = 1; od['b'] = 2`
q: how to initialize a `collections.OrderedDict()` with some content --- a: `OrderedDict( [('a', 1), ('b', 2), ...] )` is the right way, while `OrderedDict({'a': 1, 'b': 2, ...})` and `OrderedDict(a=1, b=2, ...)` are not (`kwargs` is a dict)




# tuples

q: tuples vs lists --- a: tuples are immutable lists, they have no methods to change them
q: create a tuple of one element --- `(1,)`
q: create an empty tuple --- `()`

# dicts

interesting thing: `d[k]` raises `ValueError` when the `k` is not in the dict, while `d[k] = 'whatever'`  sets the new value

``` python
d = {}
d[1]   # raises ValueError 
d[1] = 'whatever'   # sets the value
```
q: get number of key-value pairs in a dictionary --- a: `len(d)`
q: create a dictionary --- a: `d = {}` or `d = { 1: 'a', 2: 'b'}`
q: get a value from dict by a key --- a: `d['the key']` or `d.get('whatever', default='zero')`


q: get list of keys of a dict --- a: `list(a_dict.keys())`, the `.keys()` returns a view of the dict's keys
q: iterate over keys in a dict --- a: `for k in a_dict: ...`, everything is done here implicitly
q: iterate over key-value pairs in a dict --- a: `for k,v in a_dict.items(): ...`
q: check if a key exists in a dict --- a: `if k in a_dict: ...`
q: check if a key doesn't exist in a dict --- a: `if k not in a_dict: ...`
q: get a value for key in a dict, or default --- a: `d.get(k, default=0)`
q: set a value for key in a dict --- a: `d['whatever'] = 1`
q: `a_dict[k]` vs `a_dict.get(k)` --- a: the latter never raises `KeyError`, returns `None` or provided default value `a_dict.get(k, default=0)`


# sets

q: create a set --- a: empty set is created like `a_set = set()`, not `{}`; non-empty is `a_set = {1, 2, 3}`
q: create an empty set --- a: `a_set = set()`, not `{}`, because the latter is an empty dict
q: create a set from a given list --- a: `a_set = set([1, 2, 3])`
q: add an element to a set --- a: `a_set.add(e)`
q: given a set, add elements from another set to it --- a: `a_set.update(another_set)`
q: `a_set.add()` vs `a_set.update()`? --- a: `a_set.add(elt)` adds an element, `a_set.update(another_set)` adds elements from another set
q: remove an element from a set --- a: `a_set.remove(e)` raises KeyError when the element doesn't exist, `a_set.discard(e)` just silently discards it
q: `a_set.remove(e)` vs `a_set.discard(e)`? --- a: `a_set.remove(e)` raises `KeyError` when the element doesn't exist, `a_set.discard(e)` just silently discards it
q: what does `a_set.pop()` do? --- a: it pops an arbitrary element, pretty useless function
q: remove all elements from a set --- a: `a_set.clear()`
q: what are set theory functions on sets? --- a: `a_set.union(b_set)` or `|`, `a_set.intersection(b_set)` or `&`, `a_set.difference(b_set)` or `-`, `a_set.symmetric_difference(b_set)` or `^` --- all of them are non-destructive
q: check if a set is a subset or superset of another set --- a: `a_set.issubset(another_set)` and `a_set.issuperset(another_set)`; `<`, `<=` and `>`, `>=` respectively
q: check if two sets intersect --- a: `a_set.isdisjoint(another_set)`
q: check if an element is in the set, and vice versa --- a: `elt in a_set` and `elt not in a_set`



# comprehensions

``` python
[(x,y) for x in range(2) for y in range(3)]
```

q: write multidimensional list comprehension --- a: `[(x,y) for x in ... for y in ...]`
q: write a list comprehension for getting squares of odd numbers from 1 to 8 --- a: `[x**2 for x in range(1, 9) if x%2==1]`
q: write a dictionary comprehension
q: write a set comprehension

# strings

``` python
'a b c'.split() == ['a', 'b', 'c']

```

TODO: print(..., sep=', ')

TODO: rjust, ljust, center, zfill vs string.format --- print('%s %s %s %s' % (str(i).rjust(p), oct(i)[2:].rjust(p), hex(i)[2:].rjust(p), bin(i)[2:].rjust(p)))
q: print a string centered within width `w` with a minus `-` as padding char --- a: `print( string.centered(s, w, '-') )`

q: split a string, using space as separator --- a: `str.split()`
q: split a string into two pieces, using comma as a separator --- a: `'a,b,c,d'.split(',', maxsplit=1)`
q: split a string from the end into two pieces, using comma as a separator --- a: `'a,b,c,d'.rsplit(',', maxsplit=1)`
q: print float up to three digits after the point --- a: `print('%.3f' % (2.718281828))`
q: print 'hello, f l', getting those as args --- a: `print('hello, %s %s' % (f, l))`
q: reverse case of a string, lower case to upper case and vice versa --- a: `string.swapcase(str)`
q: concatenate a list of strings --- a: `''.join( lst ) `
q: concatenate a list of strings and numbers into comma-separated string --- a: `','.join( map(str, mylist) ) `
q: replace a character in string at given position --- a: `l = list('hello'); l[4]='!'; ''.join(l) == 'hell!'` or `s = '2+2'; s2 = s[:1] + '**' + s[2:]; s2 == '2**2'` --- the latter is faster
q: `substr in a_string` vs `a_string.find(substr)` vs `a_string.index(substr)` --- a: `in` is a bit faster, `find()` returns index or `-1`, `index()` is quite like find, but raises `ValueError` when not found
q: check if a substring is in a string: --- a: `substring in a_string`, which is fastest, or `a_string.find(substring) != -1` or `a_string.index(substring)` and catch `ValueError`
q: find index of a substring in a string --- a: `a_string[n:m].find(substring)` or `a_string.find(substring, n, m)`, which is faster; same with `.index()` with its `ValueError`
q: get a string of `n` minuses `-` --- a: `'-'*n`
q: get an alphabet string --- a: `string.ascii_lowercase`
q: get an uppercase alphabet string --- a: `string.ascii_uppercase`
q: get a string, which constists of all printable chars --- a: `string.printable`
q: get a string, which constists of all punctuation chars --- a: `string.punctuation`
q: reverse a string --- a: `a_string[::-1]`

# math

``` python
math.pi
math.e
math.inf   # equivalent to float('inf)
math.nan   # equivalent to float('nan')

math.floor(0.7)
math.ceil(0.7)

math.gcd(8,12) == 4
math.factorial(5) == 120

math.isfinite(5)
math.isinf( math.inf )
math.isnan( math.nan )

math.degrees( math.pi/2 )
math.radians( 90 ) == math.pi/2
math.isclose( math.sin( math.pi/6 ), 0.5 ) == True

math.pow(3.0, 2.0) == 9.0
math.log2(8.0) == 3
math.log(100.0, 10) == 2.0
math.sqrt(25.0) == 5.0
```

TODO: all these funcs

## complex numbers

in python `j` is used instead of `i` for complex unit, because they decided `j` is easier to read and it follows engineering convention for complex numbers
whatever
<http://stackoverflow.com/questions/24812444/why-are-complex-numbers-in-python-denoted-with-j-instead-of-i>

q: why `j` instead of `i` for imaginary unit in complex numbers? --- a: they decided `j` is easier to read and it follows engineering convention for complex numbers
q: convert a comlex number to polar coordinates --- a: `r, phi = cmath.polar(c)`


# python built-ins

arbitrarily grouped

# numbers
[max](https://docs.python.org/3/library/functions.html#max)
[min](https://docs.python.org/3/library/functions.html#min)
[abs](https://docs.python.org/3/library/functions.html#abs)
[round](https://docs.python.org/3/library/functions.html#round)
[sum](https://docs.python.org/3/library/functions.html#sum)
[pow](https://docs.python.org/3/library/functions.html#pow)
[divmod](https://docs.python.org/3/library/functions.html#divmod)

[bin](https://docs.python.org/3/library/functions.html#bin)
[hex](https://docs.python.org/3/library/functions.html#hex)
[oct](https://docs.python.org/3/library/functions.html#oct)

[int](https://docs.python.org/3/library/functions.html#int)
[float](https://docs.python.org/3/library/functions.html#float)
[complex](https://docs.python.org/3/library/functions.html#complex)

`pow(3, 2, 2) == 1`


`q, r = (n // d, n % d)` vs `q, r = divmod(n, d)`:
<http://stackoverflow.com/questions/30079879/is-divmod-faster-than-using-the-and-operators>


q: get max of sequence --- a: `max(s)`
q: get min of sequence --- a: `min(s)`
q: get absolute value of `x` --- a: `abs(x)`
q: get number `x` rounded to nearest integer --- a: `round(2.77) == 3`
q: get number `x` rounded to `n` digits from the decimal point --- a: `round(2,33, 1) == 2.3`
q: get sum of sequence of numbers --- a: `sum()` or `math.fsum()`
q: get `x` raised to the power of `y`, a: `x**y`
q: get `a` raised to the power of b, modulo m, a: `x**y % m` or `pow(a, b, m)`, the latter is faster
q: get quotient and remainder using integer division, a: `q, r = (n // d, n % d)` or `q, r = divmod(n, d)`
q: `q, r = (n // d, n % d)` vs `q, r = divmod(n, d)` speed, a: the latter is slower for native integers because of function call overhead, but faster for large numbers
q: get remainder after integer devision `a` by `b` --- a: `5 % 2 == 1`
q: float division vs integer division --- a: `5/2 == 2.5` vs `5 // 2 == 2`


q: convert an integer to a binary string
q: convert an integer to a hexadecimal string
q: convert an integer to a octal string (base 8)

q: convert a string to an integer
q: convert a string to a float

q: construct a complex number

## fractions

``` python
from fractions import Fraction
from decimal   import Decimal

Fraction(5, 3)
Fraction( Decimal('1.1') )
Fraction( '9/16' )

Fraction(1, 2) + 1   == Fraction(3, 2)
Fraction(1, 2) + 1.0 == 1.5

f = Fraction(1, 2)
n, d = (f.numerator, f.denominator)
print(n, d)
```

q: get a fraction from nominator/demnominator pair, decimal, and string --- a: `fractions.Fraction(5, 3)`, and `Fraction( decimal.Decimal('1.1') )`, and `Fraction('9/16')`
q: what are `fractions.Fraction(1, 2) + 1` and `Fraction(1, 2) + 1.0` --- a: `Fraction(3, 2)` and `1.5`
q: get numerator and denominator of a `f = fractions.Fraction(1, 2)` --- a: `n, d = (f.numerator, f.denominator)`
q: get greatest common divisor of two numbers --- a: `math.gcd(a, b)`


# structs and iteration
[all](https://docs.python.org/3/library/functions.html#all)
[any](https://docs.python.org/3/library/functions.html#any)
[filter](https://docs.python.org/3/library/functions.html#filter)
[map](https://docs.python.org/3/library/functions.html#map)
[zip](https://docs.python.org/3/library/functions.html#zip)
[enumerate](https://docs.python.org/3/library/functions.html#enumerate)
[len](https://docs.python.org/3/library/functions.html#len)
[next](https://docs.python.org/3/library/functions.html#next)

[sorted](https://docs.python.org/3/library/functions.html#sorted)
[reversed](https://docs.python.org/3/library/functions.html#reversed)
[slice](https://docs.python.org/3/library/functions.html#slice)
[range](https://docs.python.org/3/library/functions.html#range)

[dict](https://docs.python.org/3/library/functions.html#dict)
[iter](https://docs.python.org/3/library/functions.html#iter)
[list](https://docs.python.org/3/library/functions.html#list)
[tuple](https://docs.python.org/3/library/functions.html#tuple)
[set](https://docs.python.org/3/library/functions.html#set)
[frozenset](https://docs.python.org/3/library/functions.html#frozenset)

s[slice(0,5)] ~= s[0:5]


q: get length of x --- a: [len(x)](https://docs.python.org/3/library/functions.html#len)
q: `len(x)` vs `x.__len__` --- a: TODO: `__len__` is slower than `len()`, because `__len__` involves a dict lookup [link](http://stackoverflow.com/questions/20302558/why-python-function-len-is-faster-than-len-method/20302670#20302670)
q: merge two lists into a list of pairs --- a: `zip('abcd', [1,2,3,4])`


# input/output

[ascii](https://docs.python.org/3/library/functions.html#ascii)
[chr](https://docs.python.org/3/library/functions.html#chr)
[format](https://docs.python.org/3/library/functions.html#format)
[input](https://docs.python.org/3/library/functions.html#input)
[open](https://docs.python.org/3/library/functions.html#open)
[ord](https://docs.python.org/3/library/functions.html#ord)
[print](https://docs.python.org/3/library/functions.html#print)
[repr](https://docs.python.org/3/library/functions.html#repr)
[str](https://docs.python.org/3/library/functions.html#str)

# byte arrays

[bytearray](https://docs.python.org/3/library/functions.html#bytearray)
[bytes](https://docs.python.org/3/library/functions.html#bytes)
[memoryview](https://docs.python.org/3/library/functions.html#memoryview)



# oop

[classmethod](https://docs.python.org/3/library/functions.html#classmethod)
[staticmethod](https://docs.python.org/3/library/functions.html#staticmethod)
[property](https://docs.python.org/3/library/functions.html#property)
[super](https://docs.python.org/3/library/functions.html#super)

q: classmethod vs staticmethod, a: <http://stackoverflow.com/questions/12179271/python-classmethod-and-staticmethod-for-beginner/12179752#12179752>




# deques

q: in which module the deque is? --- a: `collections`

q: add elements to the left and to the right sides of a deck --- a: `dq.appendleft(e)` and `dq.append(e)`, or `dq.extendleft(lst)` and `dq.extend(lst)` 
q: pop elements from the left and from the right of a deque --- a: `dq.popleft()` and `dq.pop()`



`lst.index(e)` raises `ValueError` when `e` is not in the list, because a value like `-1` could lead to obscure bugs
TODO: are these same for lists?
q: what happens when `a_deque.index(x)` doesn't find the element? --- raises `ValueError`
q: get position of an element in a deque between given start and end positions --- a: `dq.index(e, start, end)`, raises `ValueError`
q: get position of an element in a deque --- a: `dq.index(e)`, raises `ValueError`
q: get number of occurrences of an element in a deque --- a: `dq.count(e)`
q: insert an element into a deque at a position --- a: `dq.insert(i, e)`

q: delete an element from a list at a given position --- a: `del lst[3]`, same as `s[3:4] = []`
q: delete the first occurrence of a value in a list --- a: `lst.remove('a')`
q: delete all occurrences of a value in a list --- a: `a[:] = [e for e in lst when e!=value]`, keep `[:]` if you want it in-place
q: get and remove an item at the end of a list --- a: `lst.pop()`
q: get and remove an item at the given position in a list --- a: `lst.pop(position)`

TODO: what are deques useful for?


# date and time

q: convert a string like `17.04.1975 14:35` to a datetime --- a: `from datetime import datetime; datetime.strptime(s, '%d.%m.%Y %H:%M')`
q: get difference in seconds between two datetimes --- a: `abs(dt2 - dt1).total_seconds()`, this is equivalent to `diff.seconds + diff.days * 86400`



# misc
[bool](https://docs.python.org/3/library/functions.html#bool)
[object](https://docs.python.org/3/library/functions.html#object)
[id](https://docs.python.org/3/library/functions.html#id)
[hash](https://docs.python.org/3/library/functions.html#hash)

q: how to assign an attribute to the built-in object class? a: prohibited, intentionally --- <http://stackoverflow.com/questions/5741699/attribute-assignment-to-built-in-object/22103924#22103924>, <http://stackoverflow.com/questions/1529002/cant-set-attributes-of-object-class/1529099#1529099>

q: what does `@something('whatever') def myfunc()` mean? --- a: this is called pie syntax for decorators, this is a fancy way of doing this: `def myfunc(): pass; myfunc = something('whatever')(myfunc)` 
q: what is a decorator? --- a: it's a function that gets a function and returns it decorated 


q: what is `None == None`? --- a: `True`
q: what is `None == 0`? --- a: `False`
q: what is `None == ''`? --- a: `False`
q: what is `None == False`? --- a: `False`
q: what if we compare `None` to something? --- a: `None == None` is `True`, while comparing to anything else is `False`



<https://www.quora.com/What-are-good-Python-interview-questions>
<http://www.ilian.io/python-interview-question-and-answers/>
<http://career.guru99.com/top-25-python-interview-questions/>

<http://www.tutorialspoint.com/python/python_interview_questions.htm>



q: declare main() in python --- a: `if __name__ == '__main__': ...`

TODO: how to measure time
$ python -m timeit "'somestring'.find('str', 2, 9)"
$ python -m timeit "'somestring'[2:9].find('str')"

q: write a lambda function --- a: `lambda x: x**2`

TODO: shallow and deep copies

q: how to get an integer `111...1` of lenght `n` without using string operations? --- a: `10**n//9`
q: how to get a palindrome number like `123454321` up to `9` in the middle? --- a: `111..11` to the power of `2`


TODO: add questions like this: in which module the `deque` is?

TODO: __slots__


## skipped hackerrank challenges

sets
<https://www.hackerrank.com/challenges/no-idea>
<https://www.hackerrank.com/challenges/py-the-captains-room>

math
<https://www.hackerrank.com/challenges/find-angle> --- python 3 is disabled

collections
<https://www.hackerrank.com/challenges/piling-up> --- deque

classes
<https://www.hackerrank.com/challenges/class-1-dealing-with-complex-numbers>
<https://www.hackerrank.com/challenges/class-2-find-the-torsional-angle>

functional
<https://www.hackerrank.com/challenges/validate-list-of-email-address-with-filter>

regex
all

xml
all

closures
<https://www.hackerrank.com/challenges/decorators-2-name-directory>




## introspection

[dir](https://docs.python.org/3/library/functions.html#dir)
[vars](https://docs.python.org/3/library/functions.html#vars)
[globals](https://docs.python.org/3/library/functions.html#globals)
[locals](https://docs.python.org/3/library/functions.html#locals)
[getattr, setattr, delattr, hasattr](https://docs.python.org/3/library/functions.html#getattr, setattr, delattr, hasattr)
[type](https://docs.python.org/3/library/functions.html#type)
[isinstance](https://docs.python.org/3/library/functions.html#isinstance)
[issubclass](https://docs.python.org/3/library/functions.html#issubclass)
[callable](https://docs.python.org/3/library/functions.html#callable)
[help](https://docs.python.org/3/library/functions.html#help)

q: dir() vs vars(...).keys() a: <http://stackoverflow.com/questions/980249/difference-between-dir-and-vars-keys-in-python>
q: check the import search path --- a: `sys.path`




## code evaluation

[compile](https://docs.python.org/3/library/functions.html#compile)
[eval](https://docs.python.org/3/library/functions.html#eval)
[exec](https://docs.python.org/3/library/functions.html#exec)

<http://stackoverflow.com/questions/2220699/whats-the-difference-between-eval-exec-and-compile-in-python>


# numpy

[`numpy.array()`](http://docs.scipy.org/doc/numpy/reference/generated/numpy.array.html)
[`numpy.array()` vs `numpy.asarray()`](http://stackoverflow.com/questions/14415741/numpy-array-vs-asarray)
[numpy arrays vs matrices](https://docs.scipy.org/doc/numpy-dev/user/numpy-for-matlab-users.html#array-or-matrix-which-should-i-use)

TODO: `numpy.array()` vs `numpy.asarray`

``` python
import numpy

print(numpy.array(['1', '2'], dtype=float))
```
q: numpy arrays vs python lists --- TODO
q: get a numpy array of floats from list of integers --- a: `numpy.array( [1, 2, 3], dtype=float )`
q: get a numpy array of floats from input --- a: `numpy.array( input().split(), dtype=float )`
q: `numpy.array` vs `numpy.ndarray` --- a: `array()` is a function that returns n-dimensional array `ndarray`, the latter shouldn't be used directly
q: `numpy.array` vs `numpy.matrix` --- a: unless you are heavily into linear algebra and want pretty matrix operations, stick with arrays
q: convert a 1x6 numpy array to 3x2 --- a: `numpy.reshape(numpy.array([1, 2, 3, 4, 5, 6]), (3, 2))`
q: what does `-1` mean in `numpy.reshape(a, (3, -1))`? --- a: it means the value is inferred from remaining dimensions
q: transpose a numpy array --- a: `numpy.transpose(a_numpy_array)`
q: convert a numpy array from _n_-dimensional to _1_-dimensional --- a: `a_numpy_array.flatten()`
q: get a numpy array of zeros 3x3x4 --- a: `numpy.zeros((3, 3, 4), dtype=float)`
q: get a numpy array of ones 3x3x4 --- a: `numpy.ones((3, 3, 4), dtype=float)`
q: get a numpy nxn array with ones on the main diagonal --- a: `numpy.identity(n)`
q: get a numpy nxm array with ones on the diagonal below the main one --- a: `numpy.eye(n, m, k=-1)`
q: get an element-wise sum, substraction, multiplication, division, floor, ceil, etc of two numpy arrays
q: get a sum, max, mean, etc of a numpy array along a given axis --- a: `numpy.sum(an_array, axis=0)`
q: get a value of a polynomial with given coefficients at point `x` --- a: numpy.polynomials.polyval(x, [3, 2, 1])








