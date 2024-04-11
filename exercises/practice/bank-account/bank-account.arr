use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

data Account:
  | account() with:
    method open(self):
      raise("please implement the open method")
    end,
    method close(self):
      raise("please implement the close method")
    end,
    method deposit(self, amount):
      raise("please implement the withdraw method")
    end,
    method withdraw(self, amount):
      raise("please implement the withdraw method")
    end,
    method get-balance(self):
      raise("please implement the get-balance method")
    end
end