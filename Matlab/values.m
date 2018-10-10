function [re_def, im_def] = values

n1re = 0.72442626953125;
n1im = -0.84814453125;

n2re = 0.85797119140625;
n2im = -0.43707275390625;

n3re = 0.97503662109375;
n3im = -0.0767822265625;

n4re = 1.11798095703125;
n4im = 0.36322021484375;

n5re = 1.38409423828125;
n5im = 1.18212890625;

n6re = 2.76007080078125;
n6im = 5.41680908203125;

n7re = -0.31964111328125;
n7im = -4.0614013671875;

n8re = 0.50006103515625;
n8im = -1.53875732421875;

re = [n1re n2re n3re n4re n5re n6re n7re n8re];
im = [n1im n2im n3im n4im n5im n6im n7im n8im];

re_nor = re./abs(max(re));
im_nor = im./abs(max(im));

for i = 1:8
    re_def(i) = sfi(re_nor(i),16,15);  
    im_def(i) = sfi(im_nor(i),16,15);
end

end

