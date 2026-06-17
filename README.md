# Apresentação IA — Apoio à Decisão Clínica

Repositório de uma **apresentação didática** sobre IA aplicada à saúde.

> ⚠️ **Material 100% didático com dados sintéticos. Não é ferramenta de diagnóstico.**

## O que é

Um **notebook do Google Colab** em português do Brasil que demonstra um protótipo de
**apoio à decisão clínica**: estima o risco de **Síndrome Metabólica** a partir de dados
de consulta no padrão **SOAP**, treinando uma **Árvore de Decisão** sobre dados sintéticos.

A narrativa: *"simulamos uma base agregada de vários profissionais de saúde e treinamos
um modelo que aprende a ir do Subjetivo + Objetivo (S+O) para a Avaliação (A)"*.

## Como usar

Abra diretamente no Google Colab e clique em **Executar tudo**:

[![Abrir no Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/PedroIgorBarbosa/Apresenta-o-IA/blob/main/Apoio_Decisao_Sindrome_Metabolica.ipynb)

Todas as bibliotecas necessárias (`pandas`, `numpy`, `scikit-learn`, `matplotlib`,
`ipywidgets`) já vêm instaladas no Colab — nenhuma instalação manual é necessária.

## Conteúdo do notebook

| # | Seção | O que faz |
|---|-------|-----------|
| 1 | Título + Disclaimer | Avisos sobre LGPD, validação clínica e ANVISA |
| 2 | Calculadora de Gasto Energético | TMB e GET pela fórmula de Mifflin-St Jeor |
| 3 | Gerador de dados sintéticos | ~800 pacientes no formato SOAP, rotulados pelos critérios IDF/ATP III |
| 4 | Pré-processamento | Converte texto em número para o modelo |
| 5 | Treino | `DecisionTreeClassifier` (`max_depth=4`, `min_samples_leaf=20`) |
| 6 | Avaliação | Acurácia ~85%, matriz de confusão, importância das variáveis |
| 7 | Visualização da árvore | `plot_tree` mostrando as regras aprendidas |
| 8 | Parte interativa | `ipywidgets` (sliders/dropdowns) + versão fallback sem widgets |
| 9 | Conclusão | Bullets para slide — o que o modelo faz e seus limites reais |

## Resultado esperado

Ao treinar, o modelo **redescobre sozinho os 5 critérios clínicos** da síndrome metabólica
(circunferência abdominal, triglicerídeos, HDL, pressão arterial e glicemia), sem que
ninguém tenha contado quais eram — o ponto central da apresentação.

## Validar localmente

```bash
pip install pandas numpy scikit-learn matplotlib ipywidgets nbconvert nbformat ipykernel
jupyter nbconvert --to notebook --execute --ExecutePreprocessor.timeout=180 \
  Apoio_Decisao_Sindrome_Metabolica.ipynb --output /tmp/executed.ipynb
```

`exit code 0` = rodou sem erros.

## Avisos importantes

- **LGPD (Lei nº 13.709/2018):** dados de saúde são dados sensíveis e exigem base legal,
  consentimento e medidas de segurança.
- **Validação clínica:** o modelo precisaria ser validado em estudos com desfechos reais.
- **ANVISA:** um software de apoio à decisão clínica pode ser enquadrado como
  *Software como Dispositivo Médico (SaMD)* e exige aprovação regulatória.

## Estrutura do repositório

```
.
├── Apoio_Decisao_Sindrome_Metabolica.ipynb   # notebook principal
├── CLAUDE.md                                  # guia para agentes Claude Code
├── .claudeignore
└── .claude/
    ├── settings.json                          # permissões e hook de setup
    └── hooks/
        └── setup.sh                           # instala dependências automaticamente
```
