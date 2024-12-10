import csv
import requests


def File_Reader():
    # this function will read the txt file line by line and return the
    # Output as a list of links.
    list_links = []
    with open('URL_links_list.txt', 'r') as file:
        for line in file:
            list_links.append(line)
            # print(list_links)
    return list_links


def URl_Checker(list_url):
    # This is function that will be called in main to check the status of the url
    # list_url = File_Reader()
    try:
        response = requests.get(list_url, timeout=5)
        status_code = response.status_code
        if status_code == 200:
            status = "up"
        else:
            status = "down"
    except requests.exceptions.RequestException:
        status_code = "N/A"
        status = "down"
    # print(status_code, status)
    return status_code, status


def main():
    # The main function handles the reading, creating and reports.
    list_url = File_Reader()

    with open("Report.csv", "w", newline="") as csvfile:
        fieldnames = ["URL", "Status Code", "Status"]
        writer = csv.writer(csvfile)
        writer.writerow(fieldnames)

        for link in list_url:
            status_code, status = URl_Checker(link)
            writer.writerow([link, status_code, status])
            print(f"{link}: {status_code} - {status}\n" )


if __name__ == "__main__":
    main()
