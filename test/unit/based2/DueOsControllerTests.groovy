package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(DueOsController)
@Mock(DueOs)
class DueOsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dueOs/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dueOsInstanceList.size() == 0
        assert model.dueOsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dueOsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dueOsInstance != null
        assert view == '/dueOs/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dueOs/show/1'
        assert controller.flash.message != null
        assert DueOs.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dueOs/list'

        populateValidParams(params)
        def dueOs = new DueOs(params)

        assert dueOs.save() != null

        params.id = dueOs.id

        def model = controller.show()

        assert model.dueOsInstance == dueOs
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dueOs/list'

        populateValidParams(params)
        def dueOs = new DueOs(params)

        assert dueOs.save() != null

        params.id = dueOs.id

        def model = controller.edit()

        assert model.dueOsInstance == dueOs
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dueOs/list'

        response.reset()

        populateValidParams(params)
        def dueOs = new DueOs(params)

        assert dueOs.save() != null

        // test invalid parameters in update
        params.id = dueOs.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dueOs/edit"
        assert model.dueOsInstance != null

        dueOs.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dueOs/show/$dueOs.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dueOs.clearErrors()

        populateValidParams(params)
        params.id = dueOs.id
        params.version = -1
        controller.update()

        assert view == "/dueOs/edit"
        assert model.dueOsInstance != null
        assert model.dueOsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dueOs/list'

        response.reset()

        populateValidParams(params)
        def dueOs = new DueOs(params)

        assert dueOs.save() != null
        assert DueOs.count() == 1

        params.id = dueOs.id

        controller.delete()

        assert DueOs.count() == 0
        assert DueOs.get(dueOs.id) == null
        assert response.redirectedUrl == '/dueOs/list'
    }
}
