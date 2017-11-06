fn return_111_if_0_and_222_otherwise(x: int) -> int {
  let result: int = if x == 0 {
    111
  } else {
    222
  };
  result
}

#[test]
fn can_use_if() {
  assert_eq!(111, return_111_if_0_and_222_otherwise(0));
  assert_eq!(222, return_111_if_0_and_222_otherwise(1));
}
