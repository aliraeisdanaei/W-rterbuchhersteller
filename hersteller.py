import sys
import webScraper




if len(sys.argv) == 3:

    with open(sys.argv[1], 'r') as wortIndexDatei:
        # for wort in wordIndexFile.readlines():
        #     # print(webScraper.wort_nachschlagen(wort))
        #     webScraper.wort_nachschlagen(wort)
            
        #     # print(wort)
        print(webScraper.wort_nachschlagen(wortIndexDatei.readline()))


        

elif len(sys.argv) != 5:
    pass
    
else:
    print("Kein Argument übergeben.")
    exit

