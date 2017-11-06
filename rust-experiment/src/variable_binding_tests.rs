#[test]
fn can_use_variable_bindings() {
  let a: int = 2;
  let b = 3i;
  let c = a + b;
  assert_eq!(5i, c);
}

#[test]
fn can_use_tuple_variable_bindings() {
  let (a, b) = (2i, 3i);
  assert_eq!(2, a);
  assert_eq!(3, b);
}

#[test]
fn can_have_mutable_variable_bindings() {
  let mut x: int = 1;
  assert_eq!(1, x);

  x = 2i;
  assert_eq!(2, x);
}
