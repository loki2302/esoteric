fn add_numbers(a: int, b: int) -> int {
  a + b
}

#[test]
fn can_use_function() {
  let result: int = add_numbers(2i, 3i);
  assert_eq!(5, result);
}
