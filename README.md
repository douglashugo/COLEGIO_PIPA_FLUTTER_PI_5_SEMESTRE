# Portal escolar PIPA

Este projeto é um aplicativo desenvolvido em Flutter que atua como um portal escolar destinado a crianças até 5 anos, proporcionando uma comunicação eficaz entre docentes e pais. O objetivo principal é facilitar o acompanhamento e o cuidado diário das crianças, além de fornecer dicas úteis e informações importantes para os pais.

### Principais Funcionalidades:

    1. Dicas:

    Os pais podem visualizar dicas úteis relacionadas a:
        - Alimentação
        - Higiene pessoal
        - Coordenação motora
        - Outras dicas relevantes para o desenvolvimento infantil.

    
    2. Avisos:
    
    Visualização de comunicados importantes enviados pelos professores ou pela escola, incluindo:
        - Comunicados gerais
        - Eventos escolares
        - Outras informações relevantes.


    3. Acompanhamento Diário:

    Os pais podem acompanhar o dia-a-dia da criança na escola, incluindo informações como:
        - Registro se a criança se alimentou adequadamente
        - Registro das necessidades fisiológicas (troca de fraldas, idas ao banheiro)
        - Registro de febre ou outros sintomas relevantes.

### Tecnologias Utilizadas
- Flutter: Framework utilizado para o desenvolvimento multiplataforma (iOS e Android).
- Supabase: Utilizado como banco de dados e backend do aplicativo. Oferece uma combinação de banco de dados PostgreSQL escalável e API RESTful para facilitar a integração com o frontend em Flutter.


### Como Executar o Projeto
Para executar este projeto localmente, siga estas instruções:

    1. Pré-requisitos:

        - Flutter SDK instalado na sua máquina.
        - Conta no Supabase para acesso ao banco de dados.


    2. Clonar o Repositório:

        - git clone https://github.com/seu-usuario/seu-projeto.git


    3. Instalar Dependências:
    
        - flutter pub get


    4. Configurar Variáveis de Ambiente:

        - Copie o arquivo .env.example para .env e configure as variáveis de ambiente necessárias, como a chave de API do Supabase.

    5. Executar o Aplicativo:

        - flutter run