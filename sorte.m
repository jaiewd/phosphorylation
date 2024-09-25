t = readtable('./final_output_with_predictions.csv');
a = unique(t.uniprot);
maxes = [];
for i = 1:length(a)
    maxes = [maxes; max(t.XGB_Predictions(strcmp(t.uniprot,a(i)))+t.phosphorylation(strcmp(t.uniprot,a(i))))];
end
a(isnan(maxes)) = [];
maxes(isnan(maxes)) = [];
[x,y] = sort(maxes,'descend');
writetable(table(a(y),x),'uniout.txt','delimiter','\t','filetype','text')