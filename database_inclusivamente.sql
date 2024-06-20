-- Essa tabela não existia mas varias tabelas tinham referencias a address de forma desorganizada assim foi criado para melhor oganização do projeto
-- Quem usa: academico, clinico, aba
CREATE TABLE adresses (
  id SERIAL PRIMARY KEY,
  zip_code VARCHAR(8),
  street VARCHAR(30),
  house_number VARCHAR(6),
  neighborhood VARCHAR(40),
  city VARCHAR(30),
  state VARCHAR(20),
  complement VARCHAR(20),
  country VARCHAR(20),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

--Quem usa: todos podem usar pelo meno para a imagem do usuário já que a imagem vai virar um text--
CREATE TABLE images(
  id SERIAL PRIMARY KEY,
  image TEXT,
  delete_at TIMESTAMP,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

--Quem usa: clinico aba, academico--
CREATE TABLE permissions(
  id SERIAL PRIMARY KEY,
  permission VARCHAR(30),
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

CREATE TABLE medicines(
  id SERIAL PRIMARY KEY,
  medicine_name VARCHAR(40),
  medicine_description TEXT,
  composition TEXT,
  dosage VARCHAR(255),
  form VARCHAR(50),
  manufacturer VARCHAR(255),
  category VARCHAR(100),
  prescription_required BOOLEAN,
  side_effects TEXT,
  contraindications TEXT,
  storage_instructions TEXT
);

CREATE TABLE  person(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  social_name VARCHAR(50),
  cpf VARCHAR(11),
  birth_date  DATE,
  gender VARCHAR(20),
  phone VARCHAR(15),
  mail VARCHAR(50),
  address_id BIGINT,
  image_id BIGINT,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL,
  FOREIGN KEY (address_id) REFERENCES adresses(id),
  FOREIGN KEY (image_id) REFERENCES images(id)
);


-- Compreende as tabelas students de academicos e clinica e clients de aba
-- Quem usa: academico, clinico, aba
CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  special_necessities VARCHAR(30), -- Escopo maior?
  education_level VARCHAR(30),
  medical_informations TEXT,
  processing_information TEXT,
  is_student BOOLEAN,
  person_id BIGINT,
  permission_id BIGINT,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL,
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (permission_id) REFERENCES permissions(id)
);

-- Era a tabela professional da clinica trasformei em uma tabela employees assim pode ser utilizado para cadastro de profissionais no academico e no aba
-- Quem usa: academico, clinico, aba
CREATE TABLE employees(
  id SERIAL PRIMARY KEY,
  department VARCHAR, -- Clínico, Acadêmico ou ABA
  position VARCHAR(50), -- Vejo como o tipo de profissional professor, diretor, fiseoterapeuta, fonaudiólogos ...
  field_of_work VARCHAR(25), -- Especialização em caso de atendimento para clinico e aba
  councils_type VARCHAR(30), -- conforme orientação do thiago devido a varios tipos de conselhos e documentos
  registre_document VARCHAR(25), -- conforme orientação do thiago devido a varios tipos de conselhos e documentos
  hiring_at date,
  dismissal_at date,
  active BOOLEAN,
  person_id BIGINT,
  permission_id BIGINT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (permission_id) REFERENCES permissions(id)
);

-- Tabela family da clinica, parents do aba e guardians do academico
-- A clinica usa uma outra tabela já que tem um relacionamento many_to_many, e o aba tinha uma student_id
-- Quem usa: academico, clinico, aba
CREATE TABLE guardians(
  id SERIAL PRIMARY KEY,
  kinship_degree VARCHAR(35),
  person_id BIGINT,
  permission_id BIGINT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (person_id) REFERENCES person(id),
  FOREIGN KEY (permission_id) REFERENCES permissions(id)
);


CREATE TABLE user_access(
  id SERIAL PRIMARY KEY,
  user_name VARCHAR(50),
  password VARCHAR(25),
  person_id BIGINT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE students_medicines(
  id SERIAL PRIMARY KEY,
  student_id BIGINT,
  medicine_id BIGINT,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);

-- reescrever tabela student_family da clinica--
--Quem usa: academico, clinico, aba--
CREATE TABLE student_guardians(
  id SERIAL PRIMARY KEY,
  student_id BIGINT,
  guardian_id BIGINT,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (guardian_id) REFERENCES guardians(id)
);

-- reescrever tabela professional_student da clinica--
--Quem usa: clinico aba? e academico?--
CREATE TABLE employees_students(
  id SERIAL PRIMARY KEY,
  relationship VARCHAR(35),
  student_id BIGINT,
  employees_id BIGINT,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (employees_id) REFERENCES employees(id)
);

--Tabelas exclusivas do clinico--
CREATE TABLE google_drive_media(
  id SERIAL PRIMARY KEY,
  description VARCHAR(50),
  file_name VARCHAR(100),
  file_type VARCHAR(100),
  url VARCHAR
);

CREATE TABLE video_records(
  id SERIAL PRIMARY KEY,
  description VARCHAR,
  recording_date DATE,
  video_url VARCHAR(100),
  id_google_drive_media BIGINT,
  cpf VARCHAR(11),
  FOREIGN KEY (id_google_drive_media) REFERENCES google_drive_media(id)
);

CREATE TABLE class_records(
  id SERIAL PRIMARY KEY,
  class_date DATE,
  end_time DATE,
  location VARCHAR(40),
  notes VARCHAR(40),
  start_time DATE,
  status VARCHAR(40),
  subject VARCHAR(40),
  media_id BIGINT,
  employee_id BIGINT,
  student_id BIGINT,
  FOREIGN KEY (media_id) REFERENCES google_drive_media(id),
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (student_id) REFERENCES students(id)
);


--Tabelas exclusivas do Academico--

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  title  VARCHAR(40),
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

CREATE TABLE pedagogical_information (
  id SERIAL PRIMARY KEY,
  title VARCHAR(40),
  content TEXT,
  category VARCHAR(40),
  image_id BIGINT,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL,
  FOREIGN KEY (image_id) REFERENCES images(id)
);

CREATE TABLE falied_jobs (
  id SERIAL PRIMARY KEY,
  uuid VARCHAR(40),
  connection TEXT,
  queue TEXT,
  payload TEXT,
  exeption TEXT,
  falied_at TIMESTAMP NOT NULL
);

CREATE TABLE password_reset_tokens(
  email VARCHAR(50),
  token VARCHAR(50),
  create_at TIMESTAMP NOT NULL
);

CREATE TABLE categories(
  id SERIAL PRIMARY KEY,
  title VARCHAR(50),
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

CREATE TABLE personal_access_tokens(
  id SERIAL PRIMARY KEY,
  tokenable_type VARCHAR(40),
  --tokenable_id --TODO da onde vem -- 
  name VARCHAR(50),
  token VARCHAR(50),
  abilities TEXT,
  last_used_at TIMESTAMP,
  expires_at TIMESTAMP,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

CREATE TABLE class(
  id SERIAL PRIMARY KEY,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

CREATE TABLE occurrences(
  id SERIAL PRIMARY KEY,
  title VARCHAR(40),
  description TEXT,
  guardian_id BIGINT,
  student_id BIGINT,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL,
  FOREIGN KEY (guardian_id) REFERENCES guardians(id),
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE announcements(
  id SERIAL PRIMARY KEY,
  title VARCHAR(40),
  content VARCHAR(40),
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL
);

CREATE TABLE communication(
  id SERIAL PRIMARY KEY,
  title VARCHAR(40),
  description TEXT, 
  class_id BIGINT,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL,
  FOREIGN KEY (class_id) REFERENCES class(id)
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title VARCHAR(40),
  description TEXT,
  category_id BIGINT,
  tag_id BIGINT,
  image_id BIGINT,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL,
  delete_at TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  FOREIGN KEY (image_id) REFERENCES images(id)
);

-- Tabalas exclusivas do ABA
CREATE TABLE protocols(
    id SERIAL PRIMARY KEY,
    protocol_name VARCHAR(40),
    status BOOLEAN,
    students_id BIGINT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    FOREIGN KEY (students_id) REFERENCES students(id)
);