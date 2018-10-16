function [re_def, im_def, total] = values

n1re = 1;
n1im = 0;

n2re = -0.4539794921875;
n2im = -0.8909912109375;

n3re = -0.5877685546875;
n3im = 0.80902099609375;

n4re = 0.9876708984375;
n4im = 0.15643310546875;

n5re = -0.30902099609375;
n5im = -0.9510498046875;

n6re = -0.70709228515625;
n6im = 0.70709228515625;

n7re = -0.9510498046875;
n7im = 0.30902099609375;

n8re = -0.15643310546875;
n8im = -0.9876708984375;

re_def = [n1re n2re n3re n4re n5re n6re n7re n8re];
im_def = [n1im n2im n3im n4im n5im n6im n7im n8im];

total = [n1re+j*n1im n2re+i*n2im n3re+i*n3im n4re+i*n4im n5re+i*n5im n6re+i*n6im n7re+i*n7im n8re+i*n8im];
% re_nor = re./abs(max(re));
% im_nor = im./abs(max(im));
% 
% for i = 1:8
%     re_def(i) = sfi(re_nor(i),16,15);  
%     im_def(i) = sfi(im_nor(i),16,15);
% end

end

