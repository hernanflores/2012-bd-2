package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(PropiedadesController)
@Mock(Propiedades)
class PropiedadesControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/propiedades/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.propiedadesInstanceList.size() == 0
        assert model.propiedadesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.propiedadesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.propiedadesInstance != null
        assert view == '/propiedades/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/propiedades/show/1'
        assert controller.flash.message != null
        assert Propiedades.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/propiedades/list'

        populateValidParams(params)
        def propiedades = new Propiedades(params)

        assert propiedades.save() != null

        params.id = propiedades.id

        def model = controller.show()

        assert model.propiedadesInstance == propiedades
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/propiedades/list'

        populateValidParams(params)
        def propiedades = new Propiedades(params)

        assert propiedades.save() != null

        params.id = propiedades.id

        def model = controller.edit()

        assert model.propiedadesInstance == propiedades
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/propiedades/list'

        response.reset()

        populateValidParams(params)
        def propiedades = new Propiedades(params)

        assert propiedades.save() != null

        // test invalid parameters in update
        params.id = propiedades.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/propiedades/edit"
        assert model.propiedadesInstance != null

        propiedades.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/propiedades/show/$propiedades.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        propiedades.clearErrors()

        populateValidParams(params)
        params.id = propiedades.id
        params.version = -1
        controller.update()

        assert view == "/propiedades/edit"
        assert model.propiedadesInstance != null
        assert model.propiedadesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/propiedades/list'

        response.reset()

        populateValidParams(params)
        def propiedades = new Propiedades(params)

        assert propiedades.save() != null
        assert Propiedades.count() == 1

        params.id = propiedades.id

        controller.delete()

        assert Propiedades.count() == 0
        assert Propiedades.get(propiedades.id) == null
        assert response.redirectedUrl == '/propiedades/list'
    }
}
