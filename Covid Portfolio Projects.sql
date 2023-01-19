SELECT *
FROM `portfolio-project-375103.covid_cases.covid_deaths`
Order BY 3,4

SELECT *
FROM `portfolio-project-375103.covid_cases.covid_vaccinations`
Order BY 3,4

-- Select Data that we will be using 
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM `portfolio-project-375103.covid_cases.covid_deaths`
ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths
--  Shows likelihood of dying if you contract Covid in your country 
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) *100 as DeathPercentage
FROM `portfolio-project-375103.covid_cases.covid_deaths`
WHERE location = 'United States'
ORDER BY 1,2


-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid
SELECT location, date, population, total_cases, (total_deaths/population) *100 as PercentPopulationInfected
FROM `portfolio-project-375103.covid_cases.covid_deaths`
WHERE location = 'United States'
ORDER BY 1,2

-- Looking at Country with Highest Infaction Rate compared to Population

SELECT location, population, MAX(total_cases) as HighestInfectionCount,  MAX((total_cases/population)) *100 as PercentPopulationInfected
FROM `portfolio-project-375103.covid_cases.covid_deaths`
GROUP BY location, population
ORDER BY PercentPopulationInfected desc

-- Showing Countries with Highest Death Count per Population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM `portfolio-project-375103.covid_cases.covid_deaths`
WHERE Continent is not null
GROUP BY location
ORDER BY TotalDeathCount desc

-- Showing continents with highest death count 

SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM `portfolio-project-375103.covid_cases.covid_deaths`
WHERE Continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc



-- Global Numbers

SELECT SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
FROM `portfolio-project-375103.covid_cases.covid_deaths`
Where Continent is not null
ORDER BY 1,2


-- Looking at total Population vs Vaccinations
-- USE CTE
With PopvsVac as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM `portfolio-project-375103.covid_cases.covid_deaths` dea
JOIN `portfolio-project-375103.covid_cases.covid_vaccinations` vac
    On dea.location = vac.location
    and dea.date = vac.date
WHERE dea.continent is not null
)
SELECT*, (RollingPeopleVaccinated/population)*100 as VaccinationPercentage
FROM PopvsVac





