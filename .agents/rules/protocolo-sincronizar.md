# Protocolo: sincronizar (o "sync")

Cuando el usuario use la palabra clave **"sincronizar"** (o **"sync"**, **"guardar todo"**), se debe ejecutar automáticamente el siguiente flujo de 3 pasos:

1. **Limpieza de temporales y ejecutables:**
   - Eliminar archivos generados y temporales en el workspace: `tempCodeRunnerFile.*`, `*.exe`, `*.o`, `*.ppu`, etc.

2. **Verificación de integridad de fechas:**
   - Comprobar con Git (`git status`, `git log`, o fecha de modificación) que los archivos modificados localmente sean más recientes que los del repositorio remoto para asegurar que no se sobreescriba información válida.

3. **Guardado y subida a GitHub:**
   - Hacer `git add` de los archivos correspondientes.
   - Generar un commit con un mensaje descriptivo y claro de las prácticas/módulos trabajados.
   - Ejecutar `git push origin main` y confirmar que el árbol quede limpio.

