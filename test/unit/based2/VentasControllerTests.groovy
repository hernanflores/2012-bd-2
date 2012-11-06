package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(VentasController)
@Mock(Ventas)
class VentasControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ventas/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ventasInstanceList.size() == 0
        assert model.ventasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ventasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ventasInstance != null
        assert view == '/ventas/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ventas/show/1'
        assert controller.flash.message != null
        assert Ventas.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ventas/list'

        populateValidParams(params)
        def ventas = new Ventas(params)

        assert ventas.save() != null

        params.id = ventas.id

        def model = controller.show()

        assert model.ventasInstance == ventas
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ventas/list'

        populateValidParams(params)
        def ventas = new Ventas(params)

        assert ventas.save() != null

        params.id = ventas.id

        def model = controller.edit()

        assert model.ventasInstance == ventas
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ventas/list'

        response.reset()

        populateValidParams(params)
        def ventas = new Ventas(params)

        assert ventas.save() != null

        // test invalid parameters in update
        params.id = ventas.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ventas/edit"
        assert model.ventasInstance != null

        ventas.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ventas/show/$ventas.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ventas.clearErrors()

        populateValidParams(params)
        params.id = ventas.id
        params.version = -1
        controller.update()

        assert view == "/ventas/edit"
        assert model.ventasInstance != null
        assert model.ventasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ventas/list'

        response.reset()

        populateValidParams(params)
        def ventas = new Ventas(params)

        assert ventas.save() != null
        assert Ventas.count() == 1

        params.id = ventas.id

        controller.delete()

        assert Ventas.count() == 0
        assert Ventas.get(ventas.id) == null
        assert response.redirectedUrl == '/ventas/list'
    }
}
