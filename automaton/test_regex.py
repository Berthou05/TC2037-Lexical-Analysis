from regex import regex

def run_tests(filename):
    file = open(filename, "r", encoding="utf-8")
    
    for line in file:
        test = line.strip()   # removes \n
        result = ("Accepted") if regex(test) else "Rejected"
        print(f"{test} -> {result}")
    
    file.close()

if __name__ == "__main__":
    run_tests("tests.txt")