from bs4 import BeautifulSoup
import requests


URL = 'https://dict.leo.org/german-english/'



def wort_nachschlagen(wort):
    print ('searching this ' +URL +wort  )
    response = requests.get(URL+wort)

    wort_soup = BeautifulSoup(response.text, 'html.parser')

    return wort_soup.find('samp')



    
    