# CLAUDE.md

Guia para agentes (Claude Code) que forem trabalhar neste repositório.

## Sobre o projeto

Repositório de uma **apresentação didática** sobre IA aplicada à saúde. O artefato
principal é um **notebook do Google Colab**, em **português do Brasil**, que demonstra
um protótipo de **apoio à decisão clínica**: estima o risco de **Síndrome Metabólica**
a partir de dados de consulta no padrão **SOAP**, treinando uma **Árvore de Decisão**
sobre **dados sintéticos**.

> ⚠️ **Importante:** é material **DIDÁTICO** com **dados sintéticos**. **Não é** ferramenta
> de diagnóstico. Qualquer alteração deve **preservar os avisos** sobre LGPD, validação
> clínica e regulação ANVISA (software como dispositivo médico).

## Estrutura

- `Apoio_Decisao_Sindrome_Metabolica.ipynb` — notebook principal (roda de cima a baixo no Colab).
- `.claude/` — configurações do Claude Code (hook de setup e permissões).
- `README.md`

## Como rodar / validar

O notebook foi feito para o **Google Colab** (todas as bibliotecas já vêm instaladas:
`pandas`, `numpy`, `scikit-learn`, `matplotlib`, `ipywidgets`). Para **validar localmente**
que ele roda de cima a baixo **sem erros**:

```bash
pip install pandas numpy scikit-learn matplotlib ipywidgets nbconvert nbformat ipykernel
jupyter nbconvert --to notebook --execute --ExecutePreprocessor.timeout=180 \
  Apoio_Decisao_Sindrome_Metabolica.ipynb --output /tmp/executed.ipynb
```

`exit code 0` = rodou sem erros. O hook de `SessionStart` em `.claude/hooks/setup.sh`
já instala essas dependências automaticamente nas sessões do Claude Code na web.

## Convenções (NÃO quebrar)

- **Idioma:** português do Brasil em **todo** o conteúdo (markdown, comentários e prints).
- **Público iniciante:** código **simples e MUITO comentado**, explicando o *porquê*, não só o *o quê*.
- **Sem dependências externas:** usar apenas bibliotecas que já vêm no Colab.
- **Reprodutibilidade:** manter a `SEMENTE` fixa (42).
- **Apresentável em ~5 min:** priorizar clareza sobre sofisticação.
- **Preservar os disclaimers:** protótipo didático, dados sintéticos, LGPD e ANVISA.

## Estrutura do notebook (padrão SOAP)

1. Título + disclaimer (LGPD, validação clínica, ANVISA)
2. Calculadora de gasto energético (TMB/GET — fórmula de Mifflin-St Jeor)
3. Gerador de dados sintéticos (~800 pacientes; rótulo pelos critérios IDF/ATP III)
4. Pré-processamento (texto → número)
5. Treino (`DecisionTreeClassifier`, `max_depth=4`, `min_samples_leaf=20`)
6. Avaliação (acurácia, matriz de confusão, importância das variáveis)
7. Visualização da árvore (`plot_tree`)
8. Parte interativa (`ipywidgets` + versão alternativa sem widgets)
9. Conclusão (bullets para slide)

## Ao editar o notebook

- **Sempre revalide** com o comando `nbconvert` acima (deve terminar com `exit 0`).
- Mantenha o `nbformat` válido se editar o `.ipynb` como JSON.
- Garanta que a célula da calculadora, do treino e da parte interativa continuem
  **coerentes entre si** (ex.: um paciente que atende 3+ critérios deve ser previsto
  como "risco elevado").
