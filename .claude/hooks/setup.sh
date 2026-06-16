#!/usr/bin/env bash
# Prepara o ambiente para rodar/validar o notebook deste repositório.
#
# Instala as bibliotecas usadas pelo notebook (as mesmas que já existem no Google
# Colab) mais as ferramentas para executá-lo de forma não-interativa (nbconvert).
#
# Uso manual:   bash .claude/hooks/setup.sh
# Também é usado como hook de SessionStart do Claude Code (ver .claude/settings.json).
set -e

pip install -q --disable-pip-version-check \
  pandas numpy scikit-learn matplotlib ipywidgets nbconvert nbformat ipykernel \
  >/dev/null 2>&1 || echo "Aviso: falha ao instalar dependencias; instale manualmente se necessario."

echo "Ambiente pronto. Valide o notebook com:"
echo "  jupyter nbconvert --to notebook --execute Apoio_Decisao_Sindrome_Metabolica.ipynb --output /tmp/executed.ipynb"
