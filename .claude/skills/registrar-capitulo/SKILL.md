# Skill: Registrar capítulo

Skill interactivo para agregar un capítulo a un libro existente en la sección de recursos del blog de ingeniería.

## Datos dinámicos

### Autores disponibles en `_data/authors.yml`

```yaml
!`cat _data/authors.yml`
```

### Libros registrados

```
!`ls _recursos/`
```

## Flujo

### 1. Seleccionar el libro

Muestra la lista de libros existentes (ver datos dinámicos arriba) y pregunta al usuario a cuál quiere agregar el capítulo.

Si `$ARGUMENTS` contiene el nombre de un libro, úsalo directamente.

### 2. Leer el archivo del libro

Lee el archivo `_recursos/{slug-libro}.md` para:

- Ver los capítulos ya registrados
- Determinar el siguiente número de capítulo
- Obtener el slug del libro para las rutas de archivos

Muestra al usuario los capítulos existentes para dar contexto.

### 3. Preguntar información del capítulo

Pregunta al usuario:

- **Número del capítulo**: sugiere el siguiente número disponible
- **Título del capítulo**
- **Resumido por**: quién resumió este capítulo. Muestra la lista de autores disponibles (ver datos dinámicos arriba)

### 4. Preguntar la ruta del PDF

Pide al usuario la **ruta absoluta** al archivo PDF en su máquina local.

Verifica que el archivo existe antes de continuar.

### 5. Copiar el PDF

Genera el nombre del PDF con esta convención:

```
cap-{NN}-{titulo-slug}.pdf
```

Donde:

- `{NN}` es el número del capítulo con zero-padding a 2 dígitos (ej: `01`, `02`, `10`)
- `{titulo-slug}` es el título del capítulo en slug (minúsculas, guiones, sin acentos ni caracteres especiales)

Ejemplo: `cap-03-patrones-de-diseno.pdf`

Copia el PDF a: `assets/docs/recursos/{slug-libro}/{nombre-pdf}`

### 6. Editar el front matter del libro

Edita el archivo `_recursos/{slug-libro}.md` para agregar la nueva entrada en el array `capitulos`.

Estructura de una entrada de capítulo:

```yaml
capitulos:
  - numero: {N}
    titulo: "{Título del capítulo}"
    pdf: {nombre-pdf}
    resumido_por: [{claves de autores}]
```

**Importante:**

- `resumido_por` usa las **claves** de `_data/authors.yml` (ej: `augusto`, `felipe`), NO los nombres completos
- `pdf` es solo el nombre del archivo (sin ruta), ya que el layout construye la ruta completa
- Mantén los capítulos ordenados por número
- No modifiques ningún otro campo del front matter ni el contenido Markdown

### 7. Verificar compilación

Ejecuta `bundle exec jekyll build` y verifica que compile sin errores. Si hay errores, corrígelos.

### 8. Confirmar al usuario

Muestra un resumen de lo agregado:

- Libro al que se agregó
- Número y título del capítulo
- Ruta del PDF copiado
- Total de capítulos del libro después de la adición
