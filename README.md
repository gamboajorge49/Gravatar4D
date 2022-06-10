## Gravatar4Delphi

Grava4Delphi is a library for implementing gravatar for delphi.



[**Gravatar web site**](https://gravatar.com)



## ⚙️ Installation

Installation is done using the [`boss install`](https://github.com/HashLoad/boss) command:

```sh
boss install github.com/gamboajorge49/Gravatar4Delphi.git
```

## ⚡️ Quickstart Delphi

```delphi
uses Gravatar4d;

var
  Gravatar: TGravatar4D;
  image: TPicture;

begin
  Gravatar := TGravatar4D.Create;
  try
    image := Gravatar.GravatarImage('user@email.com');

  finally    
    FreeAndNil(Gravatar);
  end;

end.
```

## Delphi Versions

`Gravatar4Delphi` works with Delphi 11 Alexandria, Delphi 10.4 Sydney, Delphi 10.3 Rio, Delphi 10.2 Tokyo, Delphi 10.1 Berlin, Delphi 10 Seattle, Delphi XE8 and Delphi XE7.

## ⚠️ License

`Gravatar4Delphi` is free and open-source software licensed under the [MIT License](https://github.com/gamboajorge49/Gravatar4Delphi/blob/main/LICENCE).

## 📐 Tests

![tests](https://github.com/GlerystonMatos/horse/workflows/tests/badge.svg)
