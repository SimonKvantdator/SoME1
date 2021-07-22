If you ask a physics professor what a tensor is, they will likely tell
you that "it is something that transforms like a tensor." I was
personally a bit disappointed hearing this as a Master's student in
theoretical physics, not only because of the apparent circularity of
that statement, but because there was no interest in exploring the
deeper mathematical reasons for why tensors kept appearing everywhere.
But those reasons *are* interesting, and there *is* a more insightful
definition of tensors!

Who is this explanation for? {#sec:who_is_this_explanation_for_}
============================

This text is my attempt to write down what I wish I had been taught at
the beginning of my Master's programme. The explanation I am about to
give is aimed at those with some university level maths and maybe
physics also. Ideally you have

-   heard of tensors before. Possibly in the context of physics, where
    you'll likely have seen Einstein's summation convention. Maybe
    you've even felt the same frustration over the vagueness of the
    concept as me.

-   had some linear algebra courses. You are comfortable with cross and
    dot products. It is good if you know what a linear space is.

-   at some point programmed using some programming language.

If you google "what is a tensor", there are already many people who have
tried in many ways to answer this question. Many of them also have
strong opinions about the subject. So please don't think of this as
*the* definition of tensors, but rather one of many ways to define them,
which if nothing else shows off some cool ideas from programming.

[This](https://www.quora.com/Why-is-it-difficult-to-explain-tensors?)
question on Quora gives a fairly good overview over why tensors are
difficult to pin down.

Linearity {#sec:linearity}
=========

You can skip this section if you know what a linear space is.

Even though most of these definitions are completely general, let's for
the sake of simplicity assume every linear space that we deal with is
finite-dimensional.

Many physical equations are linear. I don't know why exactly---if it is
fundamental to nature somehow or if it's something we as humans impose
on it because it's much easier to deal with. If an equation isn't
linear, we often go to great lengths to construct expansions of linear
approximations. I will take it as given that linearity is fundamental in
some way.

[\[ax:linearity\]]{#ax:linearity label="ax:linearity"} Linearity is
interesting.

entails both linear spaces and linear maps. If you've only had one
course in linear algebra, the former is probably a bit esoteric. But a
linear space is basically a set that you do linear transformations on.
So let's define things in that order.

[\[def:linear\_map\]]{#def:linear_map label="def:linear_map"} Let $R$ be
a field ($\reals$ and $\complexnumbers$ are examples of fields). If $U$
and $V$ are linear spaces over $R$ and $f \from U \to V$, then $f$ is
*linear* if

1.  $f(u + v) = f(u) + f(v)$ for all $a$, $b \in U$.
    [\[item:linearity\_plus\]]{#item:linearity_plus
    label="item:linearity_plus"}

2.  $f(c u) = c f(u)$ for all $a \in U$ and all $c \in R$.
    [\[item:linearity\_multiplication\]]{#item:linearity_multiplication
    label="item:linearity_multiplication"}

This is pretty familiar stuff! But if we think about it for a bit, what
must be true about $V$ for
[\[item:linearity\_plus,item:linearity\_multiplication\]](#item:linearity_plus,item:linearity_multiplication){reference-type="ref"
reference="item:linearity_plus,item:linearity_multiplication"} to make
sense? Well, if $f$ maps from $V$ and $f(a + b)$ should be well-defined,
then $a + b$ should be in $V$. This should be true for all $a$ and $b$.
Similarly, if $f(c a)$ should make sense, $c a$ should be in $V$ for all
$a \in V$ and all $c \in R$. We have some other things we generally want
to be true about linear spaces, but this is basically it.

[\[def:linear\_space\]]{#def:linear_space label="def:linear_space"} Let
$R$ be a field. A set $V$ is a *linear space over $R$* if

1.  For each $u$, $v \in V$, there is a unique element $u + v \in V$
    (addition).

2.  For each $u \in V$ and each $c \in R$, there is a unique element
    $c u$ (multiplication with scalar).

and

3.  $u + v = v + u$ for all $u$, $v \in V$.

4.  $(u + v) + w = u + (v + w)$ for all $u$, $v$, $w \in V$.

5.  There is an element $\mathit 0 \in V$ such that
    $\mathit 0 + u = u + \mathit 0 = u$ for all $u \in V$.

6.  For each $u \in V$ there exists an element $-u \in V$ such that
    $u + (-u) = (-u) + u = \mathit 0$.

7.  $a(b u) = (a b) u$ for all $a$, $b \in R$ and all $u \in V$.

8.  $a (u + v) + (a u) + (a v)$ for all $a \in R$ and all $u$,
    $v \in V$.

9.  $(a + b) u = (a u) + (b u)$ for all $a$, $b \in R$ and all
    $u \in V$.

10. $1 u = u$ for all $u \in V$.

As mentioned, this is just a list of formal requirements that sets must
satisfy for it to make sense to apply linear functions to their
elements. These particular kinds of requirements lists are known in
functional programming as *typeclasses*. A simpler example of a
typeclass is *totally ordered sets*, which are sets $S$ with a some
binary operation
$\leq \from S \times S \to \set{\textrm{True}, \textrm{False}}$
satisfying

1.  $x \leq x$.

2.  $x \leq y$ and $y \leq x$ $\implies x = y$.

3.  $x \leq y$ and $y \leq z$ $\implies x \leq z$.

4.  Either $x \leq y$ or $y \leq x$.

For all $x$, $y$, $z$ $\in S$.

Note that, in
[\[item:linearity\_plus,item:linearity\_multiplication\]](#item:linearity_plus,item:linearity_multiplication){reference-type="ref"
reference="item:linearity_plus,item:linearity_multiplication"} of
[\[def:linear\_map\]](#def:linear_map){reference-type="ref"
reference="def:linear_map"}, the addition and multiplication with scalar
are different operators on each side of the equals sign. In the
left-hand side of
[\[item:linearity\_plus\]](#item:linearity_plus){reference-type="ref"
reference="item:linearity_plus"}, $+ \from U \times U \to U$, while in
the right-hand side $+ \from V \times V \to V$. Both of these operators
should of course satisfy
[\[def:linear\_space\]](#def:linear_space){reference-type="ref"
reference="def:linear_space"} for $U$ and $V$ respectively.

Let's also define what we mean when we say that two linear spaces are
equal.

Two linear spaces $U$ and $V$ over a field $R$ are *isomorphic* if there
exists some linear bijection $f \from U \to V$. $f$ is then an
*isomorphism*.

Two examples of linear spaces are $\reals^2$ over $\reals$ and
$\complexnumbers$ over $\reals$. These two are in fact isomorphic,
easily seen by extending the map $(1, 0) \mapsto 1$, $(0, 1) \mapsto i$
linearly. Another example which is not isomorphic to those two is
$\complexnumbers$ over $\complexnumbers$, which shows the importance of
having the field in mind.

A useful notion in linear algebra is the dual space.

[\[def:dual\_space\]]{#def:dual_space label="def:dual_space"} Let $V$ be
a linear space over $R$. The *dual space* $\dual V$ to $V$ is the set of
linear maps $\from V \to R$.

If $\langle \cdot, \cdot \rangle$ is the natural inner product on
$\reals^n$, then an example of a dual space is $$\begin{aligned}
    \dual{(\reals^n)} = \set{ \langle v, \cdot \rangle \quad \textrm{s.th.} \quad v \in \reals^n}.\end{aligned}$$

[\[prop:dual\_dual\_space\]]{#prop:dual_dual_space
label="prop:dual_dual_space"} $\ddual V = V$.

You can prove this if you want to, but, for me at least, it feels like
it really should be true.

Einstein's summation convention {#sec:einstein_s_summation_convention}
===============================

Index notation, primarily used in relativistic physics, builds on
Einstein's summation convention. Allegedly, this was one of the
discoveries that Einstein was most thrilled about: that when writing out
the components in linear algebraic expressions, repeated indices are
always summed over. So if $v \in V$ is a vector with components
$v_\alpha$ in an orthonormal basis $B$ and $L \from V \to V$ is a linear
map with components $\tensor{L}{^\alpha_\beta}$ in $B$, then $L(v)$ has
components $$\begin{aligned}
    \sum_\alpha \tensor{L}{^\alpha_\beta} v_\alpha,\end{aligned}$$ or,
with Einstein's summation convention, $$\begin{aligned}
    \tensor{L}{^\alpha_\beta} v_\alpha.\end{aligned}$$

In this text, I will use something similar but different: *abstract
indices*. In abstract index notation, indices no longer denote
components but the actual tensors themselves. If $v_a \in V$ is a vector
and $\tensor{L}{^a_b} \from V \to V$ is a linear map, then the action of
$\tensor{L}{^a_b}$ on $v_a$ is still written $$\begin{aligned}
    \tensor{L}{^a_b} v_a,\end{aligned}$$ but the repeated index does not
mean summation anymore. It just means *action*.

In this context, a repeated index is called a *contraction*.

Partial application {#sec:partial_application}
===================

In the more well-known programming languages like Java, Python, C, etc.,
the usual procedure is to define some variables and then modify those
until you get them to the state that you want them to be in. Consider
for example the short Python program below and its output,

    L = [1, 4, 3, 2]
    L.sort()
    print(L)

    out: [1, 2, 3, 4]

Note that using the method `sort()` changes the state of `L`.

In contrast, with functional programming like Haskell, you can't modify
variables once they're defined. All you can do is to write down all of
the variables you want to use and then apply functions to them. I use
the word "function" here in its strict mathematical sense: A *function*
(or *map*) $f$ from a set $A$ to a set $B$ is a rule that assigns, to
each $a \in A$, a unique $b \in B$. We often write $f \from a \mapsto b$
or $f(a) = b$. Importantly, this means that

1.  a function does alter any state---there's no function for switching
    your clock from winter time to summer time.

2.  for a given argument $a$, a function *always* returns the same
    element $b$.

It may seem that this is very limiting, but it actually turns out that
writing code this way feels much more like doing maths than the other
type of coding! Since everything that you can use are functions, you get
very intimate with the properties of functions when programming
functionally.

One important concept is *partial application*, or *currying*. Consider
a function $f$ that takes two arguments. Maybe it looks like this:
$f \from A \times B \to C$. What if you know that the first argument
you'll be supplying is $a \in A$? Then for all intents and purposes, you
have a new function $g \from B \to C$ defined by $g(b) = f(a, b)$. But
you will also have a different such function for each $a$. So you can
think of $f$ really as a function $\hat f\from A \to B^C$ where $B^C$
denotes the set of functions from $B$ to $C$.

Are $f$ and $\hat f$ really so different then? In many cases, I would
like to be agnostic about the amount of arguments that I'm about to
supply for $f$. In functional programming, $f$ and $\hat f$ are the same
object! It is written $$\begin{aligned}
    f \from A \to B \to C.\end{aligned}$$ The function
$\hat f \from a \mapsto g$ is called a partial application of $f$ to
$a$.

As an example, consider the following Haskell program,

    bool2Int True = 1
    bool2Int False = 0
    heaviside = bool2Int . ( > 0)

which defines the Heaviside step function $$\begin{aligned}
    H(x) =
    \begin{cases}
        0, \quad x < 0\\
        1, \quad x > 0
    \end{cases}.\end{aligned}$$ Writing `( > 0)` means we partially
apply the comparison
`<`$\from \reals \times \reals \to \set{\textrm{True}, \textrm{False}}$
to $0$. The dot on the third line just means *composition*, we compose
the function `( > 0)`
$\from \reals \to \set{\textrm{True}, \textrm{False}}$ with
`bool2Int`$\from \set{\textrm{True}, \textrm{False}} \to \reals$.

Defining tensors as multilinear maps {#sec:defining_tensors_as_multilinear_maps}
====================================

A *multilinear map* is a function that takes several arguments and is
linear in each one. Cross products are an example since
$$\begin{aligned}
    (\vec{a} + \vec{b}) \times \vec{c} ={}& \vec{a} \times \vec{c} + \vec{b} \times \vec{c},\\
    (r \vec{a}) \times \vec{b} ={}& r (\vec{a} \times \vec{b}),\\
    \vec{a} \times (\vec{b} + \vec{c}) ={}& \vec{a} \times \vec{b} + \vec{a} \times \vec{c},\\
    \vec{a} \times (r \vec{b}) ={}& r (\vec{a} \times \vec{b}).\end{aligned}$$
Another example is scalar products for similar reasons. Yet another
example is the (signed) volume of a parallelepiped. If you have three
vectors $\vec a$, $\vec b$, and $\vec c$ in $\reals^3$, then they define
a parallelepiped by [1](#fig:parallelepiped){reference-type="ref"
reference="fig:parallelepiped"}. Look closely at the figure and try to
see why each vector contributes linearly to the volume.

![If $\vec a$, $\vec b$, and $\vec c$ are positively oriented according
to the right-hand rule, then the volume is
positive.[]{label="fig:parallelepiped"}](figures/parallelepiped.pdf){#fig:parallelepiped}

The magic is admittedly a bit lost if you know that the signed volume of
the parallelepiped is $\vec a \cdot (\vec b \times \vec c)$. But there
*are* examples of multilinear maps that are not cross or dot products.
The *outer product* of two vectors is $$\begin{aligned}
\label{eq:outer_product}
    (
    \begin{bmatrix}
        u_1\\
        u_2\\
        u_3
    \end{bmatrix},
    \begin{bmatrix}
        v_1\\
        v_2\\
        v_3
    \end{bmatrix}
    )
    \mapsto
    \begin{bmatrix}
        u_1\\
        u_2\\
        u_3
    \end{bmatrix}
    \begin{bmatrix}
        v_1&
        v_2&
        v_3
    \end{bmatrix}
    =
    \begin{bmatrix}
        u_1 v_1 & u_1 v_2 & u_1 v_3\\
        u_2 v_1 & u_2 v_2 & u_2 v_3\\
        u_3 v_1 & u_3 v_2 & u_3 v_3\\
    \end{bmatrix}.\end{aligned}$$

So these are a few examples of multilinear maps. Now let's make the
definition that you came here to for.

[\[def:tensor\]]{#def:tensor label="def:tensor"} Let $V$ be a linear
space over a field $R$. A valence $(k, l)$ *tensor* is multilinear map
$$\begin{aligned}
        f \from \underbrace{V \times \dots \times V}_{\times l} \to \underbrace{V \times \dots \times V}_{\times k}.
    \end{aligned}$$ Or, equivalently, a tensor is a multilinear map
$$\begin{aligned}
        f \from \underbrace{V \times \dots \times V}_{\times l} \times \dual V \to \underbrace{V \times \dots \times V}_{\times (k - 1)}
    \end{aligned}$$ or a multilinear map $$\begin{aligned}
        f \from \underbrace{V \times \dots \times V}_{\times (l - 1)} \to \dual V \times \underbrace{V \times \dots \times V}_{\times k}
    \end{aligned}$$ etc.

To see the isomorphism between these sets of multilinear maps, we will
use partial application, along with
[\[prop:dual\_dual\_space\]](#prop:dual_dual_space){reference-type="ref"
reference="prop:dual_dual_space"}. For the special case of a map
$f \from V \to V$, the argument goes like this. Map $f \from V \to V$ to
the multilinear $f' \from V \times \dual V \to R$ by
$f'(v, \dual u) = \dual u(f(v))$. Then map
$f' \from V \times \dual V \to R$ to $f'' \from V \to \dual{(\dual V)}$
by $f''(v) = f'(v, \cdot)$. But since $\dual{(\dual V)} = V$,
$f'' \from V \to V$. The kernels of each of the two maps $f \mapsto f'$
and $f' \mapsto f''$ are clearly $0$ and they are both clearly linear,
so each of them must be an isomorphism [^1]. It is not hard to extend
this argument to all different kinds of combinations of $V$ and
$\dual V$.

The preceding paragraph is fairly dense and contains some
plausible-sounding but non-obvious things. Read it slowly. In essence,
it proves that we can write tensors as multilinear maps
$$\begin{aligned}
    f \from \underbrace{V \to \dots \to V}_{\times l} \to \underbrace{\dual V \to \dots \to \dual V}_{\times k} \to R.\end{aligned}$$

Contractions {#sec:contractions}
============

With index notation, we can concisely show the valence of a tensor.
$f \from V \to V \to \dual V \to \dual V \to \dual V \to R$ may
profitably be written as $\tensor{f}{_{a b}^{c d e}}$. But writing
indices in this way also helps us denote partial applications in a way
that uniquely tells us *which* partial applications are made.

Here's the bridge between tensors as multilinear maps and tensors as
indexed objects: contractions are partial applications. As an example,
consider a valence $(2, 1)$ tensor $$\begin{aligned}
    \tensor{X}{_a_b^c} \from V \to V \to \dual V \to R\end{aligned}$$
and a valence $(0, 2)$ tensor $$\begin{aligned}
    \tensor{Y}{^a^b} \from \dual V \to \dual V \to R.\end{aligned}$$
Now, one way of viewing these tensors is to view $\tensor{X}{_a_b^c}$ as
a map $\from V \times V \to V$ and $\tensor{Y}{^a^b}$ as an element in
$V \times V$. Then we can of course act on $\tensor{Y}{^a^b}$ with
$\tensor{X}{_a_b^c}$, which is written $$\begin{aligned}
    \tensor{X}{_a_b^c} \tensor{Y}{^a^b}\end{aligned}$$ and yields a
valence $(1, 0)$ tensor (vector in $V$). But $\tensor{X}{^a_b_c}$ can
also be seen as a map $\from V \to V^V$. Then, applying
$\tensor{X}{^a_b_c}\from V \to V^V$ to the first part of
$\tensor{Y}{^a^b}$, written $$\begin{aligned}
    \tensor{X}{^a_b_c} \tensor{Y}{^c^d},\end{aligned}$$ yields a valence
$(2, 1)$ tensor.

The relation between this definition of contraction and the "repeated
indices are summed over"-one is that they're the same thing if we do
contraction explicitly in an orthogonal basis for $V$. Remember that in
my notation $\tensor{X}{^a_b_c}$ *is* the tensor while in regular index
notation $\tensor{X}{^a_b_c}$ is its components in some given basis. So
now is a pretty good time to reflect a bit on what we have actually
done. For I didn't need to mention any basis until this paragraph, so
everything we have done thus far is totally basis-independent!

Tensor product {#sec:tensor_product}
==============

You could stop reading here and still get away with a pretty solid
understanding of what a tensor is, but if you're interested, we could
talk a bit about the symbol $\otimes$ that you may have seen in relation
to tensors.

[\[def:tensor\_product\]]{#def:tensor_product
label="def:tensor_product"} Let $U_1$, ..., $U_n$ be vector spaces over
a field $R$. Then $U_1 \otimes \dots \otimes U_n$ is a linear space
equipped with a multilinear map
$\pi \from U_1 \times \dots \times U_n \to U_1 \otimes \dots \otimes U_n$
such that for any multilinear map
$f \from U_1 \times \dots \times U_n \to R$ there exists a unique linear
map $g \from U_1 \otimes \dots \otimes U_n \to R$ such that
$f = g \circ \pi$.

The space $U \otimes V$ is called the *tensor product space* of $U$ and
$V$. is fairly dense, but what it says is basically that for every
function bilinear on $U \times V$, there is a function that is linear on
$U \otimes V$. So we have yet another way of writing
[\[def:tensor\]](#def:tensor){reference-type="ref"
reference="def:tensor"}: a tensor is a linear map $$\begin{aligned}
    f \from \underbrace{V \otimes \dots \otimes V}_{\times l} \otimes \underbrace{\dual V \otimes \dots \otimes \dual V}_{\times k} \to R.\end{aligned}$$

This looks somewhat familiar thought. Recalling
[\[def:dual\_space\]](#def:dual_space){reference-type="ref"
reference="def:dual_space"}, we can rewrite the set of valence $(k, l)$
tensors as $$\begin{aligned}
    &\set{f \quad \textrm{s.th.} \quad f \textrm{ is a valence $(k, l)$ tensor}}\\
    %
    ={}& \set{f \from \underbrace{V \otimes \dots \otimes V}_{\times l} \otimes \underbrace{\dual V \otimes \dots \otimes \dual V}_{\times k} \to R \quad \textrm{s.th.} \quad f \text{ is linear}}\\
    %
    ={}& \dual{\big( \underbrace{V \otimes \dots \otimes V}_{\times l} \otimes \underbrace{\dual V \otimes \dots \otimes \dual V}_{\times k} \big)}\\
    %
    ={}& \underbrace{\dual{V} \otimes \dots \otimes \dual{V}}_{\times l} \otimes \underbrace{V \otimes \dots \otimes V}_{\times k}.\end{aligned}$$
The last step is that taking the dual space distributes over tensor
products. It is not hard to believe, and it is not difficult to prove
[^2]. Hence we can make one last very neat reformulation of
[\[def:tensor\]](#def:tensor){reference-type="ref"
reference="def:tensor"}: A tensor is an element of $$\begin{aligned}
    \underbrace{\dual{V} \otimes \dots \otimes \dual{V}}_{\times l} \otimes \underbrace{V \otimes \dots \otimes V}_{\times k}.\end{aligned}$$

Krönecker product {#sec:krönecker_product}
=================

This is all very elegant, but it is at the same time very abstract, and
it would be useful to see how these concepts look in the wild. Enter the
Krönecker product, which is *a* tensor product. You can use it for
finite-dimensional spaces for which you have a basis.

Let $$\begin{aligned}
        A =
        \begin{bmatrix}
            A_{11} & \dots & A_{1n}\\
            \vdots & \ddots & \vdots\\
            A_{m1} & \dots & A_{mn}
        \end{bmatrix}
    \end{aligned}$$ and $$\begin{aligned}
        B =
        \begin{bmatrix}
            B_{11} & \dots & B_{1q}\\
            \vdots & \ddots & \vdots\\
            B_{p1} & \dots & B_{pq}
        \end{bmatrix}
    \end{aligned}$$ be two matrices with entries in a field $R$. The
*Krönecker product* of $A$ and $B$ is $$\begin{aligned}
        \pi(A, B) =
        \begin{bmatrix}
            A_{11}
            \begin{bmatrix}
                B_{11} & \dots & B_{1q}\\
                \vdots & \ddots & \vdots\\
                B_{p1} & \dots & B_{pq}
            \end{bmatrix}
            & \dots &
            A_{1n}
            \begin{bmatrix}
                B_{11} & \dots & B_{1q}\\
                \vdots & \ddots & \vdots\\
                B_{p1} & \dots & B_{pq}
            \end{bmatrix}\\
            %
            \vdots & \ddots & \vdots\\
            %
            A_{m1}
            \begin{bmatrix}
                B_{11} & \dots & B_{1q}\\
                \vdots & \ddots & \vdots\\
                B_{p1} & \dots & B_{pq}
            \end{bmatrix}
            & \dots &
            A_{mn}
            \begin{bmatrix}
                B_{11} & \dots & B_{1q}\\
                \vdots & \ddots & \vdots\\
                B_{p1} & \dots & B_{pq}
            \end{bmatrix}
        \end{bmatrix}.
    \end{aligned}$$ So $\pi(A, B)$ is a $mp \times mq$ matrix and an is
element of the tensor product space $R^{mn} \otimes R^{pq}$. $\pi(A, B)$
is denoted $A \otimes B$.

The tensor product space $R^{mn} \otimes R^{pq} = R^{mp \times mq}$ is
much larger than the Cartesian product space
$R^{(m + p) \times (n + q)}$, which reflects the fact that it less
restrictive to be multilinear than to be linear.

We had an example earlier,
[\[eq:outer\_product\]](#eq:outer_product){reference-type="ref"
reference="eq:outer_product"}, of a multilinear map. We can see now that
this is just $\vec u \otimes \vec v$. Hence, for each bilinear function
that $f$ takes two real $3$-vectors, there is a linear function $g$ that
takes one real $3\times3$-matrix such that
$f(\vec u, \vec v) = g(\vec u \otimes \vec v)$.

How to transform like a tensor {#sec:how_to_transform_like_a_tensor}
==============================

What about the physics professor's definition of a tensor? Well, let's
think about what happens to the components of a tensor
$\tensor{T}{_i^j} \from V \to \dual V \to R$ when we make a coordinate
change to $V$. If $v$ is a vector in $V$ whose components transform as
$\tensor{v}{^i} \mapsto \tensor{A}{_j^i} \tensor{v}{^j}$ by a change of
coordinates, and if $\dual v = \langle v, \cdot \rangle \in \dual V$,
then the components of $\dual v$ should transform as
$\tensor{(\dual v)}{_i} \mapsto \tensor{(A^{-1})}{^j_i} \tensor{(\dual v)}{_j}$.
The reason for this is that $|v|^2 = \dual v v$ is invariant under
coordinate changes, and $$\begin{aligned}
    \dual v v ={}& \tensor{v}{^i} \tensor{(\dual v)}{_i}\\
    \mapsto{}& \tensor{v}{^j} \tensor{A}{_j^i} \tensor{(A^{-1})}{^k_i} \tensor{(\dual v)}{_k}\\
    ={}& \tensor{v}{^j} \tensor{\delta}{_j^k} \tensor{(\dual v)}{_k}\\
    ={}& \dual v v\end{aligned}$$ shows that this is satisfied. So with
some abuse of notation, let's write down how $T(v, \dual v)$ transforms:
$$\begin{aligned}
    \tensor{T}{_i^j}\big(
        \tensor{v}{^i},
        \tensor{(\dual v)}{_j}
    \big)
    \mapsto{}& T\big(
        \tensor{A}{_k^i} \tensor{v}{^k},
        \tensor{(A^{-1})}{^l_j} \tensor{(\dual v)}{_l}
    \big)\\
    %
    ={}& \tensor{A}{_k^i} \tensor{(A^{-1})}{^l_j} \tensor{T}{_i^j}
    \big(
        \tensor{v}{^k},
        \tensor{(\dual v)}{_l}
    \big).\end{aligned}$$ Hence the components of $\tensor{T}{_i^j}$
transform as $$\begin{aligned}
\label{eq:tensor_transformation_rules}
    \tensor{T}{_i^j} \mapsto \tensor{A}{_k^i} \tensor{(A^{-1})}{^l_j} \tensor{T}{_i^j}.\end{aligned}$$

In physics you often deal with tensor fields. Now I don't use "field" as
in $\reals$ or $\complexnumbers$ anymore but as in a function from the
space or spacetime manifold $M$ to the space of tensors. Then $V$ is
often the tangent space to $M$. If we make a coordinate change
$x \mapsto \hat x$ on $M$, then that induces a coordinate change
$\tensor{A}{_i^j} = \pdv*{\hat x_i}{x_j}$ of the tangent space. But just
substituting this into
[\[eq:tensor\_transformation\_rules\]](#eq:tensor_transformation_rules){reference-type="ref"
reference="eq:tensor_transformation_rules"} and using
$\left(\pdv*{\hat x_i}{x_j}\right)^{-1} = \pdv*{x_i}{\hat x_j}$ gives
$$\begin{aligned}
    \tensor{T}{_i^j} \mapsto \pdv{\hat x_k}{x_i} \pdv{x_j}{\hat x_l} \tensor{T}{_i^j}.\end{aligned}$$
This is the transformation law that physicists mean when they say
something transforms as a tensor. It generalizes in the obvious way for
higher valence tensors.

[^1]: There are three statements here that must be motivated:
    $\operatorname{ker}(f \mapsto f') = 0$,
    $\operatorname{ker}(f' \mapsto f'') = 0$, and that $f \mapsto f''$
    is an isomorphism. Can you come up with concise arguments for these
    when $V$ is infinite-dimensional? I don't think that I can.

[^2]: The idea is that
    $\phi \from \dual V \otimes \dual W \to \dual{(V \otimes W)}$
    defined by $\phi(f \otimes g)(v \otimes w) = f(v) g(w)$ is an
    isomorphism.
