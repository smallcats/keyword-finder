function texttowords(text)
  matchall(r"(\w+)",lowercase(replace(text, r"([\r\n,\.\(\)!;:\?/]|\ufeff)", s" ")))
end

function wordcount(wordvec)
  worddict = Dict{String,Int64}();
  for w in wordvec
    worddict[w]=get(wordvec,w,0) + 1;
  end
  worddict
end

function adddicts(dicts)
  sumdict = Dict{String,Int64}();
  for d in dicts
    for k in keys(dicts)
      sumdict[k] = get(sumdict,k,0)+1;
    end
  end
  sumdict
end

function wordfreq(worddict)
  freqdict = Dict{String,Float64}();
  totwords = sum(values(worddict));
  for k in keys(worddict)
    freqdict[k] = worddict[k]/totwords;
  end
  freqdict
end

function subdicts(d1, d2)
  diffdict = d1;
  for k in keys(d2)
    diffdict[k] = get(diffdict, k,0)-d2[k];
  end
  diffdict
end
