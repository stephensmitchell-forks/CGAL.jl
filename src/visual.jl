import CxxWrap: @cxxdereference

for T ∈ (FieldType,
        #RingType,
         AffTransformation2,
         Bbox2,
         Circle2,
         Direction2,
         IsoRectangle2,
         Line2,
         Point2,
         Ray2,
         Segment2,
         Triangle2,
         Vector2,
         WeightedPoint2,
        )
    if T === FieldType === Float64
        Base.show(io::IO, x::Ref{FT}) = show(io, x[])
        continue
    end
    @eval @cxxdereference Base.show(io::IO, x::$T) = print(io, repr(x))
end
