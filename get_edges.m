function [ edge ] = get_edges( v )
%get edges of the image
h = fspecial('average',13);
v2 = conv2(v,h,'same');
sub = v - v2;
edge = im2bw(sub,0.02);
end

