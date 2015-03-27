%% dont use this file
function houghWork( baseImage,cannyInput )
%houghWork
% hough transform
[H,theta,rho] = hough(cannyInput);
% find the peaks
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
% find lines
lines = houghlines(baseImage,theta,rho,P,'FillGap',5,'MinLength',7);

imshow(baseImage)
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','blue');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','blue');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');

end

