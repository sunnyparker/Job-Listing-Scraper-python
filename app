import requests
from bs4 import BeautifulSoup

def scrape_job_listings(url):
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        job_listings = []
        for listing in soup.find_all(class_='job'):
            title = listing.find(class_='title').get_text(strip=True)
            company = listing.find(class_='company').get_text(strip=True)
            location = listing.find(class_='location').get_text(strip=True)
            job_listings.append({'title': title, 'company': company, 'location': location})
        return job_listings
    else:
        print("Failed to retrieve data")

if __name__ == "__main__":
    url = "https://example.com/jobs"
    job_listings = scrape_job_listings(url)
    for job in job_listings:
        print(job)
