t = readtable('final_output_with_predictions.csv');
todel = zeros(1,height(t));
for i = 2:height(t)
    if strcmp(t.uniprot(i),t.uniprot(i-1)) && t.Mut_res(i)==t.Mut_res(i-1)
        todel(i) = 1;
    end
end
todel(isnan(t.XGB_Predictions))=1;
t(todel==1,:) = [];
writetable(t,'final_output_with_predictions.csv');