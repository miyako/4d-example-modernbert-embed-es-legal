# 4d-example-modernbert-embed-es-legal
ModernBERT Embed ES Legal for GGUF, ONNX

```4d
var $AIClient : cs.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8081/v1"  // onnx-genai

$inputs:=[\
"Me estás tomando el pelo."; \
"Creo que me estás engañando con una broma."\
]

$batch:=$AIClient.embeddings.create($inputs)

$es1:=$batch.embeddings[0].embedding
$es2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$es1.cosineSimilarity($es2)
```

##### Cosine similarity from example code above:

||llama.cpp `Q8_0`|ONNX Runtime `Int8`|
|-|:-|:-|
|🇪🇸|`0.5320806862869`|`0.5320806862869`|
