use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide-types *

data Account:
 | account() with:
    method open(self):
      open-account(0)
    end,
    method get-balance(self):
      raise("account not open")
    end,
    method deposit(self, amount):
      raise("account not open")
    end,
    method withdraw(self, amount):
      raise("account not open")
    end,
    method close(self):
      raise("account not open")
    end
 | open-account(balance :: NumInteger) with:
    method get-balance(self):
      self.balance
    end,
    method deposit(self, amount :: NumInteger):
      if amount <= 0:
        raise("amount must be greater than 0")
      else:
        open-account(self.balance + amount)
      end
    end,
    method withdraw(self, amount :: NumInteger):
      if amount <= 0:
        raise("amount must be greater than 0")
      else if amount > self.balance:
        raise("amount must be less than balance")
      else:
        open-account(self.balance - amount)
      end
    end,
    method close(self):
      account()
    end,
    method open(self):
      raise("account already open")
    end
end