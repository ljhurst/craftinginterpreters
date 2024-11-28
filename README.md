# [Crafting Interpreters](https://craftinginterpreters.com/)

## Repo Layout

```
├── jlox/
│   ├── src/
│   │   └── main/
│   │       └── java/
│   │           └── com/
│   │               └── craftinginterpreters/
│   │                   ├── lox/
│   │                   │   └── <source-files>
│   │                   └── tool/
│   │                       └── <source-file-helpers>
│   │
│   └── tools/
│       └── <tool-jars>
│
├── scripts/
│   └── test.lox
│
└── Makefile
```

## Makefile

### Format

```
make format
```


### Compile

```
make 
```

### Run Interactive

```
make run
```

### Run File

```
make run FILE=<path/to/file>
```

### Clean Up

```
make clean
```
