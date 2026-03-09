//%attributes = {}
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8081/v1"  // onnx-genai

$inputs:=[\
"El Tribunal Supremo declara la nulidad de pleno derecho de la cláusula suelo por falta de transparencia material.\""; \
"El Alto Tribunal dictamina que la estipulación que establece un límite a la baja en los tipos de interés es nula desde su origen al no superar el control de comprensibilidad."\
]

$batch:=$AIClient.embeddings.create($inputs)

$es1:=$batch.embeddings[0].embedding
$es2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$es1.cosineSimilarity($es2)
//0.3719723187648