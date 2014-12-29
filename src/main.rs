extern crate serialize;

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

mod variable_binding_tests;
mod function_tests;
mod if_tests;
mod looping_tests;
mod json_tests;
