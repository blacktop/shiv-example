from myapp_proto import Person

def main():
    p = Person()
    p.id = 1234
    p.name = "blacktop"
    p.email = "steve@apple.com"
    print(f"\nTEST 🤘 - \n{p}")


if __name__ == "__main__":
    main()
