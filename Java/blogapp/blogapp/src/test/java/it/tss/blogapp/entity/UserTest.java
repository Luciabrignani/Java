/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package it.tss.blogapp.entity;

import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author tss
 */
public class UserTest {

    private Validator validator;
    Set<ConstraintViolation<User>> constraintviolation;

    public UserTest() {

    }

    @BeforeEach
    public void init() {
        this.validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    @Test
    public void testNotValid() {
        User u = new User();
        u.setId(1l);
        constraintviolation = validator.validate(u);
        constraintviolation.forEach(System.out::println);
        Assertions.assertTrue(constraintviolation.size() == 4);
    }

    public void testValid() {
        User user = new User();

        user.setFirstname("mario");

        Assertions.assertTrue(user.getFirstname().equals("mario"));

        user.setLastname("rossi");

        Assertions.assertTrue(user.getLastname().equals("rossi"));

        user.setEmail("rossi@hotmail.com");

        Assertions.assertTrue(user.getEmail().equals("rossi@hotmail.com"));

        user.setPwd("12345");

        Assertions.assertTrue(user.getPwd().equals("12345"));

        constraintviolation = validator.validate(user);

        Assertions.assertTrue(constraintviolation.isEmpty());

        Assertions.assertThrows(UnsupportedOperationException.class, () -> user.getError());
    }
}
