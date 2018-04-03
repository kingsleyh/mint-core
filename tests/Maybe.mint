suite "Maybe.nothing" {
  test "returns nothing" {
    Maybe.nothing()
    |> Maybe.isNothing()
  }
}

suite "Maybe.just" {
  test "returns a just" {
    Maybe.just("")
    |> Maybe.isJust()
  }
}

suite "Comparison" {
  test "a" {
    Maybe.just("a") == Maybe.just("a")
  }
}

suite "Maybe.isJust" {
  test "returns true for a just" {
    Maybe.just("")
    |> Maybe.isJust()
  }

  test "returns false for nothing" {
    (Maybe.nothing()
    |> Maybe.isJust()) == false
  }
}

suite "Maybe.map" {
  test "maps the value of a just" {
    (Maybe.just("TEST")
    |> Maybe.map(String.toLowerCase)
    |> Maybe.withDefault("")) == "test"
  }
}

suite "Maybe.withDefault" {
  test "returns the value of a just" {
    (Maybe.just("TEST")
    |> Maybe.withDefault("")) == "TEST"
  }

  test "returns the given value for nothing" {
    (Maybe.nothing()
    |> Maybe.withDefault("TEST")) == "TEST"
  }
}

suite "Maybe.toResult" {
  test "returns the error for nothing" {
    Maybe.nothing()
    |> Maybe.toResult("Error")
    |> Result.isError()
  }

  test "returns the ok for just" {
    Maybe.just("A")
    |> Maybe.toResult("")
    |> Result.isOk()
  }

  test "sets the correct value for an ok" {
    (Maybe.just("A")
    |> Maybe.toResult("")
    |> Result.withDefault("")) == "A"
  }
}
