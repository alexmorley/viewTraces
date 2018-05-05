#!/usr/bin/julia
ttlfile = readdlm(ARGS[1], Int) #input TTL file
tlength = parse(ARGS[2]) #total number of samples desired
ttllinefile = ARGS[3] #output binary file

ttlline = zeros(Int, tlength)
for i in 1:size(ttlfile,1)
    ttlline[ttlfile[i,1]:ttlfile[i,2]] = 1000
end

function writedat(outfile, dat)
    for i in dat
        write(outfile, Int16(i))
    end
end

open(ttllinefile, "w") do f
    writedat(f, ttlline)
end
