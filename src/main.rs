fn main() {
  let x: int = 123;
  println!("Hello World! {}", x);

  let a: int = 0;
  if a == 0i {
    println!("a is zero");
  } else {
    println!("a is not zero");
  }
}

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

fn add_numbers(a: int, b: int) -> int {
  a + b
}

#[test]
fn can_use_function() {
  let result: int = add_numbers(2i, 3i);
  assert_eq!(5, result);
}

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

