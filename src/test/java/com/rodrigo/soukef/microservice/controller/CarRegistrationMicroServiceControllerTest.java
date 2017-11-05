/*package com.rodrigo.soukef.microservice.controller;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.mockito.Mockito.RETURNS_DEFAULTS;
import static org.mockito.Mockito.when;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.ezmalteria.controller.CarRegistrationMicroServiceController;
import com.ezmalteria.crud.CarRegisterCrud;
import com.ezmalteria.domain.Car;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = CarRegistrationMicroServiceController.class)
public class CarRegistrationMicroServiceControllerTest {

	@Autowired
	CarRegistrationMicroServiceController webController;

	@MockBean
	private CarRegisterCrud mockCrudService;

	@Before
	public void setUp() {
		when(mockCrudService.save(createCarStub())).thenAnswer(RETURNS_DEFAULTS);
		when(mockCrudService.findOneByLicensePlate(createCarStub().getLicensePlate())).thenAnswer(RETURNS_DEFAULTS);
		when(mockCrudService.findAll()).thenReturn(new ArrayList<Car>());
	}

	private Car createCarStub() {
		Car stubCar = new Car();

		stubCar.setLicensePlate("{\r\n" + "	\"licensePlate\":\"xxx0000\"\r\n" + "}");

		return stubCar;
	}

	@Test
	public void testIncludeNewCar() {

		assertThat(Boolean.valueOf(webController.includeNewCar("")), is(true));

	}

	@Test
	public void testCarSearch() {

		assertThat(webController.carSearch(), is(String.class));

	}

	@Test
	public void findCarByPlate() {

		assertThat(webController.findCarByPlate(createCarStub().getLicensePlate()), is(String.class));
	}

}
*/