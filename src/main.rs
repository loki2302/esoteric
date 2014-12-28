extern crate serialize;
use serialize::json;

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

// TODO: how do I move into another .rs together with extern crate thing?
#[deriving(Encodable, Decodable)]
struct Note {
  id: int,
  content: String  
}

#[test]
fn can_serialize_to_json() {
  let note = Note {
    id: 123,
    content: "hi there".to_string()
  };

  let json_string = json::encode(&note);
  assert_eq!("{\"id\":123,\"content\":\"hi there\"}", json_string);
}

#[test]
fn can_deserialize_from_json() {
  let json_string = "{\"id\":123,\"content\":\"hi there\"}";
  let note: Note = json::decode(json_string).unwrap();
  assert_eq!(123, note.id);
  assert_eq!("hi there", note.content);
}
