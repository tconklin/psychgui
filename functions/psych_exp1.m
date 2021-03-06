function [rExemplars1,rExemplars2,rExemplars3] = psych_exp1(nExemplars,nSpecies,nFamilies)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%variables used the whole exeriment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nTotal = nSpecies*nFamilies; %total number of categories
nTotal_Exemplars = nTotal*nExemplars; %total number of images
rExemplarsA = zeros(nTotal_Exemplars/2,3); %preallocating space to randomize the images
%rExemplarsB = zeros(nTotal_Exemplars/2,3); %first column: family, second: species, third: exemplar
rExemplarsC = zeros(nTotal_Exemplars/2,3); %rExemplarsB randomizes images being shown in part 1
rExemplarsD = zeros(nTotal_Exemplars/2,3); %rExemplarsD randomizes pairs of images not shown in part 1 for part 3
rExemplarsA(1:nTotal_Exemplars/nFamilies/2,1) = 1; %setting up the proper values for column 1
rExemplarsA(nTotal_Exemplars/nFamilies/2+1:nTotal_Exemplars/2,1) = 2;
rExemplarsC(1:nTotal_Exemplars/nFamilies/2,1) = 1;
rExemplarsC(nTotal_Exemplars/nFamilies/2+1:nTotal_Exemplars/2,1) = 2;
alph = 'abcdefghijklmnopqrstuvwxyz'; %assigning a letter value for each number...image format is 'aa1.png'-'sl10.png'
alph_Families = 'as';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%first part, show half the exemplars in a random order
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j = 1:nTotal
    rExemplarsA((j-1)*nExemplars/2+1:j*nExemplars/2,2) = rem(j-1,10)+1; %what the species number should be
    rExemplarsC((j-1)*nExemplars/2+1:j*nExemplars/2,2) = rem(j-1,10)+1;
    rList = randperm(nExemplars);
    rExemplarsA((j-1)*nExemplars/2+1:j*nExemplars/2,3) = rList(1:nExemplars/2); %randomly selecting a set of 6 exemplars
    rExemplarsC((j-1)*nExemplars/2+1:j*nExemplars/2,3) = rList(nExemplars/2+1:nExemplars);
end
rOrder = randperm(nTotal_Exemplars/2); %randomizing the order of the images
rExemplarsB = rExemplarsA(rOrder,:);
sizeExemplars = max(size(rExemplarsB));
for j = 1:sizeExemplars %printing the file name..in the gui each file name will be read, pause for a second, and go onto the next file name
    fprintf('%s%s%d.png \n',alph_Families(rExemplarsB(j,1)),alph(rExemplarsB(j,2)),rExemplarsB(j,3));
end

rExemplars1 = rExemplarsB;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%second part, show each possible species pair
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nPerms = nTotal*(nTotal-1)/2; %total number of permutations
permName = zeros(4,nPerms); %blank matrix for the permutations
rPerm = zeros(4,nPerms);
counter = 1; %counter to properly index each pair
for j = 1:(nTotal-1) %permutations in order (aa ab, aa ac...aa sa...)
    for k = (j+1):(nTotal)
        if j<=nSpecies
            permName(1:2,counter) = [1, j]; %family/species permutation that comes first
        else
            permName(1:2,counter) = [2, j-nSpecies];
        end 
        if k<=nSpecies
            permName(3:4,counter) = [1, k]; %family/species permutation that comes second
        else
            permName(3:4,counter) = [2, k-nSpecies];
        end
        counter = counter+1;
    end
end

rComparison = randperm(nPerms); %randomize the permutation order
rExemplars2 = zeros(nPerms,6);
for j = 1:nPerms
    rvalue = rComparison(j);
    rPerm(:,j) = permName(:,rvalue);
    imageOrder = randperm(2);
    fImage = imageOrder(1); %randomize the image order
    lImage = imageOrder(2);
    fExemplar = ceil(rand(1)*nExemplars); %randomly select an exemplar from each species
    lExemplar = ceil(rand(1)*nExemplars);
    fnames = sprintf('%s%s%d.png',alph_Families(rPerm(2*fImage-1,j)),alph(rPerm(2*fImage,j)),fExemplar); %file name of each exemplar to be shown
    lnames = sprintf('%s%s%d.png',alph_Families(rPerm(2*lImage-1,j)),alph(rPerm(2*lImage,j)),lExemplar);
    fprintf('%s and %s \n',fnames,lnames);
    rExemplars2(j,:) = [rPerm(2*fImage-1,j) rPerm(2*fImage,j) fExemplar,rPerm(2*lImage-1,j) rPerm(2*lImage,j) lExemplar];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%third part, show pairs of each species/family
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rExemplars3 = zeros(nTotal_Exemplars/4,6);
rOrder2 = randperm(sizeExemplars/2); %randomize the image order for the family pairs (rExemplarsD)
for j = 1:sizeExemplars/2
    rExemplarsD(2*j-1:2*j,:) = rExemplarsC(2*rOrder2(j)-1:2*rOrder2(j),:);
    fnames = sprintf('%s%s%d.png',alph_Families(rExemplarsD(2*j-1,1)),alph(rExemplarsD(2*j-1,2)),rExemplarsD(2*j-1,3));
    lnames = sprintf('%s%s%d.png',alph_Families(rExemplarsD(2*j,1)),alph(rExemplarsD(2*j,2)),rExemplarsD(2*j,3));
    fprintf('%s and %s \n',fnames,lnames)
    rExemplars3(j,:) = [rExemplarsD(2*j-1,1),rExemplarsD(2*j-1,2),rExemplarsD(2*j-1,3),rExemplarsD(2*j,1),rExemplarsD(2*j,2),rExemplarsD(2*j,3)];
end
