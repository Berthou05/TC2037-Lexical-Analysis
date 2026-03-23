import re

# Dôr was changed to D0r to match the Prolog verified test cases 
pattern = re.compile(r"^(Dina|Dol|D0r|Draug|Drego)$")

def regex(string):
    return bool(pattern.fullmatch(string))

if __name__ == "__main__":
    print("Testing the regex implementation:")
    while True:
        test = input("Enter a string to test or 'q' to exit: ")
        if test == "q":
            print("Exiting the test.")
            break
        result = ("Accepted") if regex(test) else "Rejected"
        print(f"{test} -> {result}")
