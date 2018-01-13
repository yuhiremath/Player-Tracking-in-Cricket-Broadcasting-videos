function [pixel_labels ] = segment_field(I)
%The folder should contain the mat file cluster_center
load('cluster_center.mat');
cform = makecform('srgb2lab');
lab_he = applycform(I,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);

ab = reshape(ab,nrows*ncols,2);

center1 = repmat(cluster_center(1,:),length(ab),1);
center2 = repmat(cluster_center(2,:),length(ab),1);

diff1 = sqrt( (center1 - ab).^2 );
diff1 = sum(diff1,2);

diff2 = sqrt( (center2 - ab).^ 2);
diff2 = sum(diff2,2);

cluster_index = diff1 - diff2;

for i = 1:length(cluster_index)
   if cluster_index(i) > 0
       cluster_index(i) = 0;
   
   else
       cluster_index(i) = 1;
   end

end


pixel_labels = reshape(cluster_index,nrows,ncols);


%imshow(pixel_labels,[]), title('image labeled by cluster index');
end

