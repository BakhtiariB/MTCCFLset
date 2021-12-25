function MTCCFLset(fid)
%% %%%%%%%%%%%%%%%%%%  MTCCFLset Feature set
%    include 173 Cross Corpus Feature Set
%%%%%%%%%%%%%%%%%%%%%  call MTCCFLset Function:
%    fid=fopen('emob_Large.arff');
%    MTCCFLset(fid);
% Output MTCCFLset Function: MTCCFLset_Mat.txt , MTCCFLset_MAT.mat , MTCCFLset_XLS.xls

% Not: MTCCFLset feature set is used only with of emolarge config
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read File
K=textscan(fid,['%q',repmat('%f',[1,6553]),'%s'],'Delimiter',',','CollectOutput',1,'headerlines', 6559);
fclose(fid);
m1=K(1,1);B1=m1{1,1}; m2=K(1,2);B2=m2{1,1}; m3=K(1,3);B3=m3{1,1};
if (size(B1,1)==0 ||size(B2,1)==0 || size(B3,1)==0)
    disp('Sorry, Is not emolarg config!')
    return;
else
    MTCCFLset_Feature=K{1,2};
    MTCCFLset_Feature=MTCCFLset_Feature(:,2:end);
    %%   Andis 173 Feature MTCCFLset
    MTCCFLset_Set_Andis=[59 60 61 62 65 66 67 70 72 87 94 98 111 137 150 203 204 211 212 215 ...
        220 229 230 231 232 233 410 411 423 449 469 524 564 584 590 603 606 607 ...
        608 618 619 621 623 629 631 645 647 657 658 660 684 685 686 723 725 748 ...
        1027 1054 1057 1061 1066 1105 1581 1583 1598 1607 1608 1615 1616 1625 ...
        1643 1646 1647 1654 1655 1664 1665 1671 1672 1673 1678 1703 1704 1877 ...
        1899 1905 1906 1908 1910 1937 1938 1976 1977 2015 2016 2094 2132 2133 ...
        2149 2150 2163 2165 2166 2178 2179 2180 2181 2182 2183 2254 2255 2653 ...
        2736 2737 2775 2776 2791 2793 2807 3211 3238 3241 3242 3245 3250 3254 ...
        3289 3328 3792 3799 3800 3818 3820 3830 3839 3856 4973 4976 4977 4978 ...
        4991 5051 5395 5422 5426 5434 5438 5448 6032 6033 6034 6047 6048 6049 ...
        6050 6063 6064 6086 6087 6088 6089 6110 6111 6115 6149 6150 6163 6165 ...
        6166 6178 6203 6204 6241];
    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Fea=MTCCFLset_Feature(:,MTCCFLset_Set_Andis);% 173 feature MTCCFLset
    %%  Output
    save('MTCCFLset_Mat.txt','Fea','-ascii'); % TXT Output Format
    save('MTCCFLset_MAT.mat','Fea');          % Mat Output Farmat
    xlswrite('MTCCFLset_XLS.xls',Fea);        % Xls Output Format
end
end

