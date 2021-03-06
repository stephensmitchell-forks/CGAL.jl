@doc raw"""
    Plane3

An object `h` of the data type [`Plane3`](@ref) is an oriented plane in the
three-dimensional Euclidean space ``Ε^3``.

It is defined by the set of points with Cartesian coordinates ``(x,y,z)`` that
satisfy the plane equation

```math
    h:\; a\, x + b\, y + c\, z + d = 0.
```

The plane splits ``Ε^3`` in a *positive* and a *negative side*. A point `p` with
Cartesian coordinates ``(px, py, pz)`` is on the positive side of `h`, iff
``a\, px + b\, py + c\, pz + d > 0``. It is on the negative side, iff
``a\, px + b\, py + c\, pz + d < 0``.
"""
Plane3

@doc raw"""
    Plane3(a::Real, b::Real, c::Real, d::Real)

Create a plane `h` defined by the equation ``a\, px + b\, py + c\, pz + d = 0``.

Notice that `h` is degenerate if ``a = b = c = 0``.
"""
Plane3(a::Real, b::Real, c::Real, d::Real) =
    Plane3(convert(FT, a), convert(FT, b),
           convert(FT, c), convert(FT, d))

"""
    Plane3(p::Point3, q::Point3, r::Point3)

Create a plane `h` passing through the points `p`, `q`, and `r`.

The plane is oriented such that `p`, `q` and `r` are oriented in a positive
sense (that is counterclockwise) when seen form the positive side of `h`. Notice
that `h` is degenerate if the points are collinear.
"""
Plane3(p::Point3, q::Point3, r::Point3)

"""
    Plane3(p::Point3, v::Vector3)

Introduces a plane `h` that passes through point `p` and that is orthogonal to
`v`.
"""
Plane3(p::Point3, v::Vector3)

"""
    Plane3(p::Point3, d::Direction3)

Introduces a plane `h` that passes through point `p` and that has an orthogonal
direction equal to `d`.
"""
Plane3(p::Point3, d::Direction3)

"""
    Plane3(l::Line3, p::Point3)

Introduces a plane `h` that is defined through the three points `point(l, 0)`,
`point(l, 1)` and `p`.
"""
Plane3(l::Line3, p::Point3)

"""
    Plane3(r::Ray3, p::Point3)

Introduces a plane `h` that is defined through the three points `point(r, 0)`,
`point(r, 1)` and `p`.
"""
Plane3(r::Ray3, p::Point3)

"""
    Plane3(s::Segment3, p::Point3)

Introduces a plane `h` that is defined through the three points `source(s)`,
`target(s)` and `p`.
"""
Plane3(s::Segment3, p::Point3)

"""
    Plane3(c::Circle3)

Introduces a plane `h` that is defined as the plane containing the circle `c`.
"""
Plane3(c::Circle3)

"""
    ==(h₁::Plane3, h₂::Plane3)

Test for equality: two planes are equal, iff they have a non empty intersection
and the same orientation.
"""
==(h₁::Plane3, h₂::Plane3)

"""
    a(h::Plane3)

Returns the first coefficient of `h`.
"""
a(h::Plane3)

"""
    b(h::Plane3)

Returns the second coefficient of `h`.
"""
b(h::Plane3)

"""
    c(h::Plane3)

Returns the third coefficient of `h`.
"""
c(h::Plane3)

"""
    d(h::Plane3)

Returns the fourth coefficient of `h`.
"""
d(h::Plane3)

"""
    perpendicular_line(h::Plane3, p::Point3)

Returns the line that is perpendicular to `h` and that passes through point `p`.

The line is oriented from the negative to the positive side of `h`.
"""
perpendicular_line(h::Plane3, p::Point3)

"""
    projection(h::Plane3, p::Point3)

Returns the orthogonal projection of `p` on `h`.
"""
projection(h::Plane3, p::Point3)

"""
    opposite(h::Plane3)

Returns the plane with opposite orientation.
"""
opposite(h::Plane3)

"""
    point(h::Plane3)

Returns an arbitrary point on `h`.
"""
point(h::Plane3)

"""
    orthogonal_vector(h::Plane3)

Returns a vector that is orthogonal to `h` and that is directed to the positive
side of `h`.
"""
orthogonal_vector(h::Plane3)

"""
    orthogonal_direction(h::Plane3)

Returns a direction that is orthogonal to `h` and that is directed to the positive
side of `h`.
"""
orthogonal_direction(h::Plane3)

"""
    base1(h::Plane3)

Returns a vector orthogonal to [`orthogonal_vector()`](@ref).
"""
base1(h::Plane3)

"""
    base2(h::Plane3)

Returns a vector that is both orthogonal to [`base1()`](@ref), and to
[`orthogonal_vector()`](@ref), and such that the result of `orientation(
point(h), point(h) + base1(h), point(h) +
base2(h), point(h) + orthogonal_vector(h) )` is positive.
"""
base2(h::Plane3)

"""
    to_2d(h::Plane3, p::Point3)

Returns the image point of the projection of `p` under an affine transformation,
which maps `h` onto the ``xy``-plane, with the ``z``-coordinate removed.
"""
to_2d(h::Plane3, p::Point3)

"""
    to_3d(h::Plane3, p::Point2)

Returns a point `q`, such that `to_2d(h, to_3d(h, p))` is equal to `p`.
"""
to_3d(h::Plane3, p::Point2)

"""
    oriented_side(h::Plane3, p::Point3)

Returns either [`ON_ORIENTED_BOUNDARY`](@ref), or the constant
[`ON_POSITIVE_SIDE`](@ref), or the constant [`ON_NEGATIVE_SIDE`](@ref),
determined by the position of `p` relative to the oriented plane `h`.
"""
oriented_side(h::Plane3, p::Point3)

"""
    has_on(h::Plane3, p::Point3)

Returns `true`, iff `p` properly lies on `h`.
"""
has_on(h::Plane3, p::Point3)

"""
    has_on_positive_side(h::Plane3, p::Point3)

Returns `true`, iff `p` lies on the positive side of `h`.
"""
has_on_positive_side(h::Plane3, p::Point3)

"""
    has_on_negative_side(h::Plane3, p::Point3)

Returns `true`, iff `p` lies on the negative side of `h`.
"""
has_on_negative_side(h::Plane3, p::Point3)

"""
    has_on(h::Plane3, l::Line3)

Returns `true`, iff `l` properly lies on `h`.
"""
has_on(h::Plane3, l::Line3)

"""
    has_on(h::Plane3, c::Circle3)

Returns `true`, iff `c` properly lies on `h`.
"""
has_on(h::Plane3, c::Circle3)

"""
    is_degenerate(h::Plane3)

Plane `h` is degenerate, if the coefficients `a`, `b`, and `c` of the plane
equation are zero.
"""
is_degenerate(h::Plane3)

"""
    transform(h::Plane3, t::AffTransformation3)

Returns the plane obtained by applying `t` on a point of `h` and the
orthogonal direction of `h`.
"""
transform(h::Plane3, t::AffTransformation3)
