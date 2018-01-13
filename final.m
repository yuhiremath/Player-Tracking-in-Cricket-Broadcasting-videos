%The folder should contain the avi file as written in videoreader
% It should contain the mask file
%It should contain the cluster_center mat file 
%It should contain two functions get_edges and segmentd_field

video = VideoReader('MIvsR.avi');
n = video.NumberOfFrames;
mov(1:11)=struct('cdata',[],'colormap',[]);
%mov(1:n) = struct('data',[]);
%mask = imread('mask.jpg');
%[m,l] = size(mask);
%[m,k,l] = size(read(video,10));
%image_structure = zeros(m,k,l,2);

for i = 690:700
    I = read(video,i);
    r = I(:,:,1); g = I(:,:,2); b = I(:,:,3);
    hsv = rgb2hsv(I);
   % h = hsv(:,:,1); s = hsv(:,:,2); 
    v = hsv(:,:,3);
    if ( 2*sum(g(:)) - sum(r(:)) - sum(b(:)) > 0)
        edge = get_edges(v);
        %edge = im2bw(edge);
        segmented = segment_field(I);
        segmented = im2bw(segmented);
        seg_edge = segmented + edge ; 
        seg_edge = im2bw(seg_edge);
        %final_image = mask & seg_edge;
        %s = regionprops(final_image, 'BoundingBox');
        s = regionprops(seg_edge, 'BoundingBox');
        rect = reshape([s.BoundingBox], 4, []).';
        rects = rect( [find( rect(:,3).*rect(:,4) > 1000  & rect(:,3).*rect(:,4) < 100000)],: );
        I = insertShape(I,'rectangle',rects);  
    end
    
    %figure;
    set(gcf,'Visible','off');
    imshow(I);    
    mov(i-600 +1)=getframe(gcf);
    %close;
%      image_structure(:,:,:,i) = I;
%     seg_edge = uint8(seg_edge);
%     seg_edge = insertShape(seg_edge,'rectangle',rects);  
%     figure;
%     imshow(seg_edge);
    
  
end

%movie2avi(mov, 'player_track.avi', 'compression', 'None');