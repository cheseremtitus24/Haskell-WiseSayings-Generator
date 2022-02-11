ghc  Main.hs FileReader.hs -package random -o main.out && rm -r *.hi *.o && echo "Finished Compiling now use the ./test.sh to Rerun" && chmod +x test.sh && ./main.out 
